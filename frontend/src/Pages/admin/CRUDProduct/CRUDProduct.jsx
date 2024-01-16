import React, { useEffect, useState } from 'react'
import './CRUDProduct.css'
import axios from 'axios';
import { Link } from 'react-router-dom';
const CRUDProduct = () => {
    const [products, setProducts] = useState([]);

    useEffect(() => {
      // Gọi API để lấy dữ liệu sản phẩm từ backend
      axios.get('http://localhost:8081/product')
        .then(response => {
          // Dữ liệu trả về từ API
          const dataFromApi = response.data.recordset;
    
          // Chuyển đổi dữ liệu để có mảng các đối tượng mới
          const transformedData = dataFromApi.map(item => ({
            productID: item.productID,
            name: item.name, // Thay 'name' bằng tên cột tương ứng trong dữ liệu
            price: item.price, // Thay 'price' bằng tên cột tương ứng trong dữ liệu
            stock: item.stock,
            category: item.category,
            imageUrl: item.imageUrl // Thay 'imageURL' bằng tên cột tương ứng trong dữ liệu
          }));
    
          // Cập nhật state 'products' với mảng mới
          setProducts(transformedData);
    
          console.log(transformedData);
          console.log(products); // Lưu ý: Đây sẽ hiển thị giá trị ban đầu của 'products', không phải giá trị mới sau khi set state.
        })
        .catch(error => console.error('Error fetching products:', error));
    }, []);

    const handleDelete = async (productId) => {
      try{
        const response = await axios.delete(`http://localhost:8081/deleteproduct/${productId}`)

          console.log(response.data);
          if(response.data.success){
            alert("Đã xóa thành công");
            setProducts(prevProducts => prevProducts.filter(product => product.productID !== productId));
          }
          else alert("Lỗi! không thể xóa")
          // Nếu xóa thành công, cập nhật state 'products' bằng cách loại bỏ sản phẩm đã xóa
        }
      catch(err){ console.log(err);
    }
  }
  return (
    <div className='crud-product'>
        <div className="crud-container">
            <Link to='/admin/crudproduct/addproduct'><button className='add-btn'>Add +</button></Link>
            <table className='table'>
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Category</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {
                        products.map((data, i)=>(
                            <tr key={i}>
                                <td><Link to={`/product/${data.productID}`}><img src={data.imageUrl} alt=''/></Link></td>
                                <td><Link to={`/product/${data.productID}`} style={{textDecoration: 'none',color: 'black',textTransform:'uppercase',fontSize:'16px'}}>{data.name}</Link></td>
                                <td>{data.price} 000</td>
                                <td>{data.stock}</td>
                                <td>{data.category}</td>
                                <td className='action-btn'>
                                    <Link to={`/admin/crudproduct/updateproduct/${data.productID}`}><button className='update-btn'>Update</button></Link>
                                    <Link><button className='delete-btn' onClick={()=>handleDelete(data.productID)}>Delete</button></Link>
                                </td>
                            </tr>
                        ))
                    }
                </tbody>
            </table>
        </div>

    </div>
  )
}

export default CRUDProduct