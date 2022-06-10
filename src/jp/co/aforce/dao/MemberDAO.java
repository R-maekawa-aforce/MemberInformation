package jp.co.aforce.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jp.co.aforce.beans.MemberInfo;
import jp.co.aforce.tool.ConstNum;

public class MemberDAO extends DAO{
	public int check(
			String last_name,
			String first_name,
			String sex,
			int birth_year,
			int birth_month,
			int birth_day,
			String job,
			String phone_number,
			String mail_address) throws Exception{

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(ConstNum.SQL_KK01_S01);
		st.setString(1, last_name);
		st.setString(2, first_name);
		st.setString(3, sex);
		st.setInt(4, birth_year);
		st.setInt(5, birth_month);
		st.setInt(6, birth_day);
		st.setString(7, job);
		st.setString(8, phone_number);
		st.setString(9, mail_address);
		ResultSet rs = st.executeQuery();

		int count = 0;
		while(rs.next()) {
			count = rs.getInt(1);
		}

		st.close();
		con.close();

		return count;
	}

	public int insert(
			String member_id,
			String last_name,
			String first_name,
			String sex,
			int birth_year,
			int birth_month,
			int birth_day,
			String job,
			String phone_number,
			String mail_address) throws Exception {
		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(ConstNum.SQL_KK01_I01);
		st.setString(1, member_id);
		st.setString(2, last_name);
		st.setString(3, first_name);
		st.setString(4, sex);
		st.setInt(5, birth_year);
		st.setInt(6, birth_month);
		st.setInt(7, birth_day);
		st.setString(8, job);
		st.setString(9, phone_number);
		st.setString(10, mail_address);
		int line = st.executeUpdate();

		st.close();
		con.close();
		return line;

	}

	public MemberInfo seach(String member_id) throws Exception {
		Connection con = getConnection();

		MemberInfo m = new MemberInfo();

		PreparedStatement st = con.prepareStatement(ConstNum.SQL_KK02_S01);
		st.setString(1, member_id);

		ResultSet rs = st.executeQuery();


		while(rs.next()) {
			m.setMember_id(member_id);
			m.setLast_name(rs.getString("last_name"));
			m.setFirst_name(rs.getString("first_name"));
			m.setSex(rs.getString("sex"));
			m.setBirth_year(Integer.parseInt(rs.getString("birth_year")));
			m.setBirth_month(Integer.parseInt(rs.getString("birth_month")));
			m.setBirth_day(Integer.parseInt(rs.getString("birth_day")));
			m.setJob(rs.getString("job"));
			m.setPhone_number(rs.getString("phone_number"));
			m.setMail_address(rs.getString("mail_address"));
		}

		st.close();
		con.close();

		return m;

	}


	public int update (
			String member_id,
			String last_name,
			String first_name,
			String sex,
			int birth_year,
			int birth_month,
			int birth_day,
			String job,
			String phone_number,
			String mail_address) throws Exception{

		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(ConstNum.SQL_KK02_U01);
		st.setString(1, last_name);
		st.setString(2, first_name);
		st.setString(3, sex);
		st.setInt(4, birth_year);
		st.setInt(5, birth_month);
		st.setInt(6, birth_day);
		st.setString(7, job);
		st.setString(8, phone_number);
		st.setString(9, mail_address);
		st.setString(10,member_id);

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;
	}


	public int delete(String member_id) throws Exception{
		Connection con = getConnection();

		PreparedStatement st = con.prepareStatement(ConstNum.SQL_KK03_D01);
		st.setString(1, member_id);

		int line = st.executeUpdate();

		st.close();
		con.close();

		return line;

	}
}
