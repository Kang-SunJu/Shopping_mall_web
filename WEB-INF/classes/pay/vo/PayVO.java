package pay.vo;

public class PayVO {
	private String Userid;
    private String ordername;
    private String product_id[];
    private String su[];
    private String address[], addresses;
    private String phone[], phones;
    private String price[];

    
    
    public String[] getPrice() {
		return price;
	}

	public void setPrice(String[] price) {
		this.price = price;
	}

	/**
     * @return the orderid
     */
    public String getUserid() {
        return Userid;
    }

    /**
     * @param object the orderid to set
     */
    public void setUserid(String Userid) {
        this.Userid = Userid;
    }

    /**
     * @return the product
     */
    public String[] getProduct_id() {
        return product_id;
    }

    /**
     * @param product the product to set
     */
    public void setProduct_id(String[] product_id) {
        this.product_id = product_id;
    }

    /**
     * @return the su
     */
    public String[] getSu() {
        return su;
    }

    /**
     * @param su the su to set
     */
    public void setSu(String[] su) {
        this.su = su;
    }

    /**
     * @return the address
     */
    public String[] getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String[] address) {
        this.address = address;
        addresses = String.join("<br>", address);
        }

    /**
     * @return the addresses
     */
    public String getAddresses() {
        return addresses;
    }

    /**
     * @param addresses the addresses to set
     */
    public void setAddresses(String addresses) {
        this.addresses = addresses;
        address = addresses.split("<br>");
    }

    /**
     * @return the phone
     */
    public String[] getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String[] phone) {
        this.phone = phone;
        phones = String.join("-", phone);
    }

    /**
     * @return the phones
     */
    public String getPhones() {
        return phones;
    }

    /**
     * @param phones the phones to set
     */
    public void setPhones(String phones) {
        this.phones = phones;
        phone = phones.split("-");
    }

	/**
	 * @return the ordername
	 */
	public String getOrdername() {
		return ordername;
	}

	/**
	 * @param ordername the ordername to set
	 */
	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}

}
