// ManageOrder.js
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import './ManageOrder.css'; // Import file CSS để tùy chỉnh giao diện
import { Link } from 'react-router-dom';

const ManageOrder = () => {
  const [orders, setOrders] = useState([]);

  useEffect(() => {
    // Gọi API để lấy danh sách tất cả đơn hàng từ server (không cần phải truyền username)
    const fetchOrders = async () => {
      try {
        const response = await axios.get('http://localhost:8081/admin/orders');
        setOrders(response.data);
      } catch (error) {
        console.error('Error fetching orders:', error);
      }
    };

    fetchOrders();
  }, []);

  // Tạo một đối tượng để nhóm đơn hàng theo orderID
  const groupedOrders = orders.reduce((result, order) => {
    const orderID = order.orderID;

    if (!result[orderID]) {
      result[orderID] = {
        orderID: orderID,
        status: order.status,
        sum: order.sum,
        orderDate: new Date(order.orderDate).toLocaleString(),
        username: order.username,
        products: [],
        address: order.address
      };
    }

    // Thêm thông tin sản phẩm vào mảng products của đơn hàng
    result[orderID].products.push({
      oderProductID: order.oderProductID,
      quantity: order.quantity,
      priceProduct: order.priceProduct,
      productID: order.productID,
      name: order.name,
      price: order.price,
      stock: order.stock,
      category: order.category,
      imageUrl: order.imageUrl,
    });

    return result;
  }, {});

  // Chuyển đối tượng thành mảng
  const groupedOrdersArray = Object.values(groupedOrders);

  return (
    <div className="order-list-container">
      <h2>Danh sách đơn hàng của tất cả người dùng</h2>
      <ul className="order-list">
        {groupedOrdersArray.map((order) => (
          <li key={order.orderID} className="order-item">
            <div className="left">
              <p className="order-info">Mã đơn hàng #{order.orderID}</p>
              <p className="order-info">Ngày đặt hàng: {order.orderDate}</p>
              <p className="order-info">Người đặt hàng: {order.username}</p>
              <p className='order-info'>Địa chỉ: {order.address}</p>
              <p className="order-info">Tổng giá trị: <span>{order.sum} .000vnđ</span></p>
              <p className='order-info'>Trạng thái:{order.status === false ? <span>Chưa hoàn thành</span> : <span>Đã hoàn thành</span>}</p>
            </div>
            <table className="right">
              {order.products.map((product) => (
                <tr className='list-product' key={product.productID}>
                  <td><Link to={`/product/${product.productID}`}>
                    <img src={product.imageUrl} className='carticon-product-icon' alt="" /></Link>
                  </td>
                  <td className='name'> <Link to={`/product/${product.productID}`} style={{ textDecoration: 'none', color: '#454545' }}>
                    <p style={{textTransform: 'uppercase'}}>{product.name}</p>
                  </Link>
                  </td>
                  <td className='price'>Đơn giá: {product.priceProduct} .000nvđ</td>
                  <td className='quantity'>Số lượng: {product.quantity}</td>
                </tr>
              ))}
            </table>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ManageOrder;
