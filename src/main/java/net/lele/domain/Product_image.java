package net.lele.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class Product_image {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	
	int productid;
	
	String filename;
	String fileOriName;
	String fileurl;
}
