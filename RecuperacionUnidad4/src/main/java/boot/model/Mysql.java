package boot.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="mysql")
public class Mysql implements Serializable {

	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(length=30)
	private String dataBase;
	@Column(length=30)
	private String hostname;
	@Column(length=30)
	private String password;
	@Column(length=30)
	private String username;
	
	
	public Mysql(String dataBase, String hostname, String password, String username) {
		super();
		this.dataBase = dataBase;
		this.hostname = hostname;
		this.password = password;
		this.username = username;
	}

	public Mysql(){
		this("","","","");
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDataBase() {
		return dataBase;
	}

	public void setDataBase(String dataBase) {
		this.dataBase = dataBase;
	}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Override
	public String toString() {
		return "Mysql [id=" + id + ", dataBase=" + dataBase + ", hostname=" + hostname + ", password=" + password
				+ ", username=" + username + "]";
	}

	
}
