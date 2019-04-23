package com.internousdev.jupiter.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.jupiter.dto.DestinationInfoDTO;
import com.internousdev.jupiter.util.DBConnector;


public class DestinationInfoDAO {

//DBに宛先入力情報をInsertする
	public int insert(String userId,String familyName,String firstName,String familyNameKana,String firstNameKana,String email,String telNumber,String userAddress){
	DBConnector db=new DBConnector();
	Connection con=db.getConnection();
	int count=0;

//SQL文
	String sql = "INSERT INTO destination_info(user_id,family_name,first_name,family_name_kana,first_name_kana,email,tel_number,user_address,regist_date,update_date) VALUES (?,?,?,?,?,?,?,?,now(),now())";

	try{
		PreparedStatement preparedStatement=con.prepareStatement(sql);
		preparedStatement.setString(1, userId);
		preparedStatement.setString(2, familyName);
		preparedStatement.setString(3, firstName);
		preparedStatement.setString(4, familyNameKana);
		preparedStatement.setString(5, firstNameKana);
		preparedStatement.setString(6, email);
		preparedStatement.setString(7, telNumber);
		preparedStatement.setString(8, userAddress);
		count=preparedStatement.executeUpdate();
		}catch (SQLException e){
			e.printStackTrace();
			}finally{
				try{
					con.close();
					}catch(SQLException e){
						e.printStackTrace();
						}
				}
	return count;
	}

//DBから宛先情報を取得
	public List<DestinationInfoDTO>getDestinationInfo(String userId){
		DBConnector db=new DBConnector();
		Connection con=db.getConnection();
		List<DestinationInfoDTO>destinationInfoDTOList=new ArrayList<DestinationInfoDTO>();

//SQL文
		String sql="SELECT id,family_name,first_name,family_name_kana,first_name_kana,email,tel_number,user_address FROM destination_info where user_id=?";

		try{
			con= db.getConnection();
			PreparedStatement preparedStatement=con.prepareStatement(sql);
			preparedStatement.setString(1, userId);
			ResultSet rs=preparedStatement.executeQuery();

			while(rs.next()){
				DestinationInfoDTO destinationInfodto=new DestinationInfoDTO();
				destinationInfodto.setId(rs.getInt("id"));
				destinationInfodto.setFamilyName(rs.getString("family_name"));
				destinationInfodto.setFirstName(rs.getString("first_name"));
				destinationInfodto.setFamilyNameKana(rs.getString("family_name_kana"));
				destinationInfodto.setFirstNameKana(rs.getString("first_name_kana"));
				destinationInfodto.setUserAddress(rs.getString("user_address"));
				destinationInfodto.setEmail(rs.getString("email"));
				destinationInfodto.setTelNumber(rs.getString("tel_number"));
				destinationInfoDTOList.add(destinationInfodto);
				}
			}catch(SQLException e){
				e.printStackTrace();
				}finally{
					try{
						con.close();
						}catch(SQLException e){
							e.printStackTrace();
							}
					}
		return destinationInfoDTOList;
		}
	}