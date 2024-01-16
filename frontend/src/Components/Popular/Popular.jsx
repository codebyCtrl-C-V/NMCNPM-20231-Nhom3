import React, { useContext, useEffect, useState } from 'react'
import './Popular.css'
import data_product from '../Assets/data'
import Item from '../Item/Item'
import axios from 'axios'
import { ShopContext } from '../../Context/ShopContext'
const Popular = () => {
  const {products, getProducts,popular} = useContext(ShopContext);
  console.log(popular);
  return (
    <div className='popular'>
        <h1>Bán chạy nhất</h1>
        <hr/>
        <div className="popular-item">
            {popular.map((item,i)=>{
                return <Item key={i} id={item.productID} name={item.name} image={item.imageUrl} price={item.price} stock={item.stock} category={item.category}/>
            })}
        </div>
    </div>
  )
}

export default Popular