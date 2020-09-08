package com.dxc.shoppingcart.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.dxc.shoppingcart.model.UserProduct;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "Orders")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Order implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7046907332782399492L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="orderid")
	private Integer orderId;

	@ElementCollection
	@CollectionTable(name="userproducts")
	private List<UserProduct> productList;
	@Column(name="totalcost")
	private double totalCost;

}
