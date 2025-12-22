package DeliveryPerson;

public class DeliveryModel {
	private int id;
	private String name;
	private String nic;
	private String vehicleType;
	private String licenNo;
	private String phone;
	
	public DeliveryModel(int id, String name, String nic, String vehicleType, String licenNo, String phone) {
		super();
		this.id = id;
		this.name = name;
		this.nic = nic;
		this.vehicleType = vehicleType;
		this.licenNo = licenNo;
		this.phone = phone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getVehicleType() {
		return vehicleType;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	public String getLicenNo() {
		return licenNo;
	}

	public void setLicenNo(String licenNo) {
		this.licenNo = licenNo;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	

}
