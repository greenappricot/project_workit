package com.workit.member.model.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.workit.member.model.dto.Department;
import com.workit.member.model.dto.Job;
import com.workit.member.model.dto.MemberAuthority;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberVO implements UserDetails{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String memberId;
	private String memberName;
	private String profileImg;
	private String password;
	private String memberNo;
	private String phone;
	private String address;
	private String email;
	private Date hireDate;
	private Date entDate;
	private int salary;
	private int leave;
	private String subAddress;
	private Department dept;
	private Job job;
	
	@Override //권한 판단
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> auth=new ArrayList<>();
		if(dept.getDeptCode().equals("D3")) auth.add(new SimpleGrantedAuthority(MemberAuthority.DEPT_EMP.name()));
		if(job.getJobAuth().equals("MASTER")) auth.add(new SimpleGrantedAuthority(MemberAuthority.MASTER.name()));
		if(job.getJobAuth().equals("SUBMASTER")||job.getJobAuth().equals("MASTER")) auth.add(new SimpleGrantedAuthority(MemberAuthority.SUBMASTER.name()));
		if(job.getJobAuth().equals("TEAMMASTER")||job.getJobAuth().equals("MASTER")
				||job.getJobAuth().equals("TEAMMASTER")) auth.add(new SimpleGrantedAuthority(MemberAuthority.TEAMMASTER.name()));
		if(job.getJobAuth().equals("EMP")||job.getJobAuth().equals("MASTER")
				||job.getJobAuth().equals("TEAMMASTER")||job.getJobAuth().equals("EMP")) {
			auth.add(new SimpleGrantedAuthority(MemberAuthority.EMP.name()));
		}
		return auth;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return memberId;
	}
	
	@Override
	public String getPassword() {
		return password;
	}
	
	@Override //퇴사 기간 지나면 권한 만료
	public boolean isAccountNonExpired() {
		Date today=new Date();
		return entDate!=null&&today.before(entDate);
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
	
}