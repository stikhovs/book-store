package components;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
@Scope(value = "session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RegisterUserComponent {

	@NotEmpty(message = "��� �� ����� ���� ������")
	@Pattern(regexp = "[\\D]+", message = "���� ������ ��������� ������ �����")
	private String firstName;
	
	@NotEmpty(message = "����������, ������� ���� �������")
	@Pattern(regexp = "[\\D]+", message = "���� ������ ��������� ������ �����")
	private String lastName;
	
	@NotEmpty(message = "����������, ������� ���� ����� ��������")
	@Pattern(regexp = "^((8|\\+7)[\\- ]?)?(\\(?\\d{3}\\)?[\\- ]?)?[\\d\\- ]{7,10}$", message = "����������, ������� ����� � ������ �������")
	private String phone;
	
	@NotEmpty(message = "����������, ������� ���� email")
	@Email (message = "����������, ������� email � ���������� �������")
	private String email;
	
	@NotEmpty(message = "������ �� ����� ���� ������")
	private String password;
	
	@NotEmpty(message = "������ �� ����� ���� ������")
	private String passwordConfirm;

	private MultipartFile file;
	
	private String avatarPath;
	
	private final long maxImageSize = 1 * 1024 * 1024;

	public String getAvatarPath() {
		return avatarPath;
	}

	public void setAvatarPath(String avatarPath) {
		this.avatarPath = avatarPath;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public long getMaxImageSize() {
		return maxImageSize;
	}

	public RegisterUserComponent() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "RegisterUserComponent [firstName=" + firstName + ", lastName=" + lastName + ", phone=" + phone
				+ ", email=" + email + ", password=" + password + ", passwordConfirm=" + passwordConfirm + ", file="
				+ file + ", avatarPath=" + avatarPath + "]";
	}
	
	public String getDateOfCreation() {
		return String.valueOf(new Date().getTime());
	}
	
}
