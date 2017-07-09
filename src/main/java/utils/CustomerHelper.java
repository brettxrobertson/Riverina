package utils;

import java.util.List;
import java.util.stream.Collectors;

import model.Job;
import model.Sql2oModel;

/**
 * @author brettrobertson1
 *
 */
public class CustomerHelper {

	Sql2oModel model;
	Integer customerId;
	
	public CustomerHelper(Sql2oModel model, Integer customerId){
		this.model = model;
		this.customerId = customerId;
	}
	
	public List<Job> getJobsByCustomer(){
		
		List<Job> jobs = model.getAllJobs(null);
		
		List<Job> filteredList = jobs.stream()
				.filter(job -> job.getCustomerId() == customerId)
				.collect(Collectors.toList());
		
		return filteredList;
	}
}
