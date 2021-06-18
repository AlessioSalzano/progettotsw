package it.unisa.model;

public class UserBean {
	private String email;
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    public boolean valid;
    private String indirizzo;
    private int numerocarta;
    private int cvv;
    private String intestatario;
    private boolean admin=false;
    
    public boolean isAdmin() {
		return admin;
	}public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	public String getEmail() {
		return email;
	}public void setEmail(String email) {
		this.email = email;
	}
	public String getIntestatario() {
		return intestatario;
	}public void setIntestatario(String intestatario) {
		this.intestatario = intestatario;
	}
    public String getFirstName() {
       return firstName;
	}

    public void setFirstName(String newFirstName) {
       firstName = newFirstName;
	}

	
    public String getLastName() {
       return lastName;
			}

    public void setLastName(String newLastName) {
       lastName = newLastName;
			}
			

    public String getPassword() {
       return password;
	}

    public void setPassword(String newPassword) {
       password = newPassword;
	}
	
			
    public String getUsername() {
       return username;
			}

    public void setUserName(String newUsername) {
       username = newUsername;
			}

				
    public boolean isValid() {
       return valid;
	}

    public void setValid(boolean newValid) {
       valid = newValid;
	}	
    
    public int getCvv() {
		return cvv;
	}
    
    public String getIndirizzo() {
		return indirizzo;
	}
    
    public int getNumerocarta() {
		return numerocarta;
	}
    public void setCvv(int cvv) {
		this.cvv = cvv;
	}
    public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
    public void setNumerocarta(int numerocarta) {
		this.numerocarta = numerocarta;
	}
    public void setUsername(String username) {
		this.username = username;
	}
}

