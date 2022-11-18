package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	//자신의 참조값을 저장할 Static 필드(하나만 만들어 놓고 사용할 예정)
	private static MemberDao dao;
	
	//외부에서 객체생성을 못하도록 생성자의 접근 지정자를 private 로 한다.
	
	private MemberDao() {}
	
	//자신의 참조값을 리턴하는 static 메소드를 제공한다.
	public static MemberDao getInstance() {
		//만일 최초 호출이라면 자신의 객체를 생성해서 static 필드에 담아둔다.
		if(dao==null) {
			dao=new MemberDao();
		}
		return dao;
	}
	//전체 회원의 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		List<MemberDto> list=new ArrayList<>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection pool 에서 Connection 객체를 하나 얻어온다.
			conn=new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql="select num,name,addr"
					+ " From member"
					+ " order by num asc";
			//sql 문의 ? 바인딩할게 있으면 한다.
			
			pstmt=conn.prepareStatement(sql);
			//select  문을 수행하고 결과값을 받아온다.
			rs=pstmt.executeQuery();
			//반복문을 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			while(rs.next()) {
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				//araylist 객체에 누적시킨다.
				list.add(dto);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch (Exception e) {}
		}
		return list;
	}
	public boolean insert(MemberDto dto) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		int rowCount=0;
		try {
			//Connection pool 에서 Connection 객체를 하나 얻어온다.
			conn=new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql="insert into member"
					+ " (num,name,addr)"
					+ " values(member_seq.nextval,?,?)";
			//sql 문의 ? 바인딩할게 있으면 한다.
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,dto.getName());
			pstmt.setString(2,dto.getAddr());
			rowCount=pstmt.executeUpdate();//psmt.executeUpdate 추가 변경 삭제된 갯수
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch (Exception e) {}
			}
			if (rowCount>0) {//추가,변경,삭제된 것이 있을경우 true 아닌경우 false
				return true;
			}else {
				return false;
				
			
		}
	}
	//회원 한명의 정보를 삭제하는 메소드
   	public boolean delete(int num) {
   		Connection conn = null;
   		PreparedStatement pstmt = null;
   		int rowCount = 0;
   		try {
   			conn = new DbcpBean().getConn();
   			String sql = "DELETE FROM member"
   					+ " WHERE num=?";
   			pstmt = conn.prepareStatement(sql);
   			// ? 에 바인딩할게 있으면 해주고
   			pstmt.setInt(1, num);
   			// INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
   			rowCount = pstmt.executeUpdate();
   		} catch (Exception e) {
         e.printStackTrace();
   		} finally {
    	  try {
    		  if (pstmt != null)
    			  pstmt.close();
    		  if (conn != null)
    			  conn.close();
         } catch (Exception e) {}
   			}
      if (rowCount > 0) {
         return true;
      } else {
         return false;
      }
   }
   	//회원 한명의 정보를 리턴하는 메소드
   	public MemberDto getData(int num) {
       
       MemberDto dto=null;
       
       //필요한 객체를 담을 지역변수를 미리 만들어 둔다. 
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       try {
          //Connection Pool 에서 Connection 객체를 하나 얻어온다.
          conn = new DbcpBean().getConn();
          //실행할 sql 문의 뼈대 구성하기
          String sql = "SELECT name,addr"
                + " FROM member"
                + " WHERE num=?";
          pstmt = conn.prepareStatement(sql);
          //sql 문의 ? 에 바인딩 할게 있으면 한다.
          pstmt.setInt(1, num);
          //SELECT 문을 수행하고 결과값을 받아온다.
          rs = pstmt.executeQuery();
          //만일 select 된 row 가 있다면 (커서 다음에 select 된 row 가 있다면)
          if (rs.next()) {
             //MemberDto 객체를 생성해서 회원 한명의 정보를 담는다.
             dto=new MemberDto();
             dto.setNum(num);
             dto.setName(rs.getString("name"));
             dto.setAddr(rs.getString("addr"));
          }
       } catch (Exception e) {
          e.printStackTrace();
       } finally {
          try {
             if (rs != null)
                rs.close();
             if (pstmt != null)
                pstmt.close();
             if (conn != null)
                conn.close(); //Connection Pool 에 Connection 반납하기
          } catch (Exception e) {
          }
       }
       return dto;
    }
   	//회원 한명의 정보를 수정반영하는 메소드
   	public boolean update(MemberDto dto) {
   		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			String sql = "update memeber"
					+ " set name=?, addr=?"
					+ " where num=?";
			// ? 에 바인딩할게 있으면 해주고
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			pstmt = conn.prepareStatement(sql);
			// INSERT OR UPDATE OR DELETE 문을 수행하고 수정되거나, 삭제되거나, 추가된 ROW 의 갯수 리턴 받기
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
   	}
   		
 }

	

