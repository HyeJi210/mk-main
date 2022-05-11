package net.lele.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import net.lele.domain.User;
import net.lele.model.UserRegistrationModel;
import net.lele.repository.UserRepository;
import net.lele.utils.EncryptionUtils;

@Service
public class UserService {
	@Autowired
	UserRepository userRepository;
	
	public User login(String userId, String password) {
		User user = userRepository.findOneByUserId(userId);
		if (user == null)
			return null;
		String pw = EncryptionUtils.encryptMD5(password);

		if (user.getPassword().equals(pw) == false)
			return null;
		return user;
	}
	
	public User findByUserId(String userId) {
		return userRepository.findByUserId(userId);
	}
	
	public User findByNickname(String nickname) {
		return userRepository.findByNickname(nickname);
	}
	
	public User findById(int id) {
		return userRepository.findById(id);
	}

	public boolean hasErrors(UserRegistrationModel userModel, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return true;
		if (userModel.getPasswd1().equals(userModel.getPasswd2()) == false) {
			bindingResult.rejectValue("passwd2", null, "비밀번호가 일치하지 않습니다.");
			return true;
		}

		User user = userRepository.findOneByUserId(userModel.getUserid());
		if (user != null) {
			bindingResult.rejectValue("userid", null, "사용자 아이디가 중복됩니다.");
			return true;
		}
		return false;
	}

	public User createEntity(UserRegistrationModel userModel) {
		User user = new User();
		String pw = EncryptionUtils.encryptMD5(userModel.getPasswd1());
		user.setUserId(userModel.getUserid());
		user.setPassword(pw);
		user.setUserType("user");
		user.setEnable(1);
		user.setEmail(userModel.getEmail());
		user.setAddress(userModel.getAddress());
		user.setName(userModel.getName());
		user.setPhone(userModel.getPhone());
		user.setAddress_detail(userModel.getAddress_detail());
		user.setPostcode(userModel.getPostcode());
		user.setAddrplus(userModel.getAddrplus());
		user.setNickname(userModel.getNickname());
		
		return user;
	}
	
	public void update(User user) {
		User u = new User();
		u.setState(user.getState());
		u.setCity(user.getCity());
		
		userRepository.save(u);
	}

	public void save(UserRegistrationModel userModel) {
		User user = createEntity(userModel);
		userRepository.save(user);
	}
}