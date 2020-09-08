package com.dxc.shoppingcart.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Embeddable
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserProduct {

	@Column(name = "productid")
	private Integer productId;
	@Column(name = "productname")
	private String productName;
	private int quantity;
	private double price;
	@Column(name = "totalpriceperitem")
	private double totalpricePerItem;
	private float discount;

}
