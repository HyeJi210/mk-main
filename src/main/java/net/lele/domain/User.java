package net.lele.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
@org.hibernate.annotations.DynamicUpdate
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	int enable;
	String userId;

	String password;
	String userType;
	String name;
	String nickname;
	String email;
	String phone;
	String address;
	String address_detail;
	int postcode;
	String addrplus;
	
	@ManyToOne
	@JoinColumn(name = "stateid")
	State state;

	@ManyToOne
	@JoinColumn(name = "cityid")
	City city;
}
