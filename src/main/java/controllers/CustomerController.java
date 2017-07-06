package controllers;

import java.util.List;
import java.util.Map;

import model.Customer;
import spark.Request;

public interface CustomerController {

	List<Customer> getAllCustomers();

	void addCustomer(Map<String, String> params);

}