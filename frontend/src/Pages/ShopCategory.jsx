import React, { useContext, useEffect, useState } from 'react'
import axios from 'axios';
import './CSS/ShopCategory.css'
import Item from '../Components/Item/Item';
import dropdown_icon from '../Components/Assets/dropdown_icon.png'
import { ShopContext } from '../Context/ShopContext';

const ShopCategory = (props) => {
  const {products, getProducts} = useContext(ShopContext);

  useEffect(() => {

    // Gọi API để lấy dữ liệu sản phẩm từ backend
    // axios.get('http://localhost:8081/product')
    //   .then(response => {
    //     // Dữ liệu trả về từ API
    //     const dataFromApi = response.data.recordset;
  
    //     // Chuyển đổi dữ liệu để có mảng các đối tượng mới
    //     const transformedData = dataFromApi.map(item => ({
    //       productID: item.productID,
    //       name: item.name, // Thay 'name' bằng tên cột tương ứng trong dữ liệu
    //       price: item.price, // Thay 'price' bằng tên cột tương ứng trong dữ liệu
    //       stock: item.stock,
    //       category: item.category,
    //       imageUrl: item.imageUrl // Thay 'imageURL' bằng tên cột tương ứng trong dữ liệu
    //     }));
  
    //     // Cập nhật state 'products' với mảng mới
    //     setProducts(transformedData);
  
    //     console.log(transformedData);
    //     console.log(products); // Lưu ý: Đây sẽ hiển thị giá trị ban đầu của 'products', không phải giá trị mới sau khi set state.
    //   })
    //   .catch(error => console.error('Error fetching products:', error));
  }, [products]);
  
  return (
    <div className="shop-product">
      <div className='shop-category'>
        <div className="shopcategory-products">
          {products.map((item,i)=>{
            if(props.category===item.category)
              return <Item key={i} id={item.productID} name={item.name} image={item.imageUrl} price={item.price} stock={item.stock}/>
            else {
              return null;
            }
          })}
        </div>
        <div className="shopcategory-loadmore">
          Explore More
        </div>
      </div>
    </div>

  )
}

export default ShopCategory