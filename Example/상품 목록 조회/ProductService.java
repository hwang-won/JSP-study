package ch08;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// 데이터베이스 없이 샘플 데이터 제공하기 위한 ProducrService 클래스

public class ProductService {
	Map<String, Product> products = new HashMap<>();
	
	public ProductService() {
		Product p = new Product("101", "Iphone12", "apple", 1200000, "2020.12.12");
		products.put("101", p);
		p = new Product("102", "galuxyS21", "samsung", 1000000, "2021.2.2");
		products.put("102", p);
		p = new Product("103", "lgphone", "lg", 800000, "2018.3.2");
		products.put("103", p);
	}
	
	public List<Product> findAll() {
		return new ArrayList<>(products.values());
	}
	
	public Product find(String id) {
		return products.get(id);
	}
}
