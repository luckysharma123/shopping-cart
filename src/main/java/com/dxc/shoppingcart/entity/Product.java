package com.dxc.shoppingcart.entity;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "product")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Product implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 9037011849262432117L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="productid")
	private Integer productId;
	@Lob
	@Basic(fetch = FetchType.LAZY)
	@Column(name="productimage")
	private byte[] productImage;
	@Column(name="productname")
	private String productName;
	private int quantity;
	private double price;
	private float discount;

}
