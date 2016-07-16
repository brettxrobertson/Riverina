package model;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Jobs generated by hbm2java
 */
public class Job implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8336848484627894847L;
	private Integer id;
	private Customer customer;
	private JobStatus jobStatus;
	private User users;
	private String jobName;
	private Date date;
	private String notes;
	private Set<Components> components = new HashSet<Components>(0);

	/*
	
	public Job() {
	}

	public Job(Customer customer, JobStatus jobStatus, User users, String jobName) {
		this.customer = customer;
		this.jobStatus = jobStatus;
		this.users = users;
		this.jobName = jobName;
	}

	public Job(Customer customers, JobStatus jobStatus, User users, String jobName, Date date, String notes,
			Set<Components> components) {
		this.customer = customers;
		this.jobStatus = jobStatus;
		this.users = users;
		this.jobName = jobName;
		this.date = date;
		this.notes = notes;
		this.components = components;
	}
*/
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Customer getCustomers() {
		return this.customer;
	}

	public void setCustomers(Customer customers) {
		this.customer = customers;
	}

	public JobStatus getJobStatus() {
		return this.jobStatus;
	}

	public void setJobStatus(JobStatus jobStatus) {
		this.jobStatus = jobStatus;
	}

	public User getUsers() {
		return this.users;
	}

	public void setUsers(User users) {
		this.users = users;
	}

	public String getJobName() {
		return this.jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getNotes() {
		return this.notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Set<Components> getComponentses() {
		return this.components;
	}

	public void setComponentses(Set<Components> components) {
		this.components = components;
	}

}
