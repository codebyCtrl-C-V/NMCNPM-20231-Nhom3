import axios from "axios";
import { useEffect, useState } from "react";
var all_product = []
const Product = () => {
    const [products,setProducts] = useState([]);
 useEffect(() => {
    // Gọi API để lấy dữ liệu sản phẩm từ backend
      axios.get('http://localhost:8081/product')
    .then(response => {
        setProducts(response.data);
        all_product = products;
    })
    .catch(error => console.error('Error fetching products:', error));
    }, []);
}

export default all_product;


