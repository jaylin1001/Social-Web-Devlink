package com.devlink.member;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.devlink.dao.Member;
import com.devlink.dao.Search;
import com.devlink.me.model.MemberMapper;

//빈등록
@Component("memService")   //객체이름
public class ServiceImpl implements Service{
   
   @Resource(name="sqlSession")   //의존성주입
   private SqlSession sqlSession;
   private MemberMapper memberMapper;
   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
   }
   
   @Override
   public void addMember(Member m) {
      // TODO Auto-generated method stub
      System.out.println("addMember" + m);
      memberMapper = sqlSession.getMapper(MemberMapper.class);
      memberMapper.insert(m);
   }

   @Override
   public Member getMember(String id) {
      // TODO Auto-generated method stub
      memberMapper = sqlSession.getMapper(MemberMapper.class);
      Member m =memberMapper.select(id);
      System.out.println(m);
      return m;
   }

   @Override
   public void editMember(Member m) {
      // TODO Auto-generated method stub
      memberMapper = sqlSession.getMapper(MemberMapper.class);
      memberMapper.update(m);
   }

   @Override
   public void delMember(String id) {
      // TODO Auto-generated method stub
      memberMapper = sqlSession.getMapper(MemberMapper.class);
      memberMapper.delete(id);
   }

   @Override
   public void editEmail(Member m) {
      // TODO Auto-generated method stub
      memberMapper = sqlSession.getMapper(MemberMapper.class);
      memberMapper.updateemail(m);
      
   }

   @Override
   public void editPhone(Member m) {
      // TODO Auto-generated method stub
      memberMapper = sqlSession.getMapper(MemberMapper.class);
      memberMapper.updatephone(m);
      
   }

   @Override
   public void editAddress(Member m) {
      // TODO Auto-generated method stub
      memberMapper = sqlSession.getMapper(MemberMapper.class);
      memberMapper.updateaddress(m);
      
      
   }

   @Override
   public void editPwd(Member m) {
      // TODO Auto-generated method stub
      memberMapper = sqlSession.getMapper(MemberMapper.class);
      memberMapper.updatepwd(m);
   }

   @Override
   public Member getMemberPwd(String pwd) {
      // TODO Auto-generated method stub
      memberMapper = sqlSession.getMapper(MemberMapper.class);
      Member m = memberMapper.selectpwd(pwd);
      return m;
   }

   @Override
	public void addSearch(Member m) {
	   	System.out.println("회원가입자 이름 : "+m.getName());
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		/*String last=lastChar(name);*/
		HashMap<String,String> hmap  = memberMapper.function(m.getName());
		String nmdiv=hmap.get("path");
		System.out.println(nmdiv);
		nmdiv=replace(nmdiv);
		System.out.println(nmdiv);
		Search s = new Search();
		s.setNm(m.getName());
		s.setNm_div(nmdiv);
		s.setM_no(m.getM_no());
		System.out.println(s);
		memberMapper.insertSearch(s);
		System.out.println("here3");
	}

	@Override
	public String getNo(String id) {
		System.out.println("getNo() : id="+id);
		memberMapper = sqlSession.getMapper(MemberMapper.class);
		HashMap<String,String> hmap = memberMapper.selectNoById(id);
		return hmap.get("no");
	}   

	private String replace(String nmdiv) {
		String result="";
		int index=nmdiv.indexOf("\\");
		if(index>0) {
			nmdiv=nmdiv.replace("\\3131","ㄱ");
			nmdiv=nmdiv.replace("\\3134","ㄴ");
			nmdiv=nmdiv.replace("\\3137","ㄷ");
			nmdiv=nmdiv.replace("\\3139","ㄹ");
			nmdiv=nmdiv.replace("\\3141","ㅁ");
			nmdiv=nmdiv.replace("\\3142","ㅂ");
			nmdiv=nmdiv.replace("\\3145","ㅅ");
			nmdiv=nmdiv.replace("\\3147","ㅇ");
			nmdiv=nmdiv.replace("\\3148","ㅈ");
			nmdiv=nmdiv.replace("\\314A","ㅊ");
			nmdiv=nmdiv.replace("\\314B","ㅋ");
			nmdiv=nmdiv.replace("\\314C","ㅌ");
			nmdiv=nmdiv.replace("\\314D","ㅍ");
			nmdiv=nmdiv.replace("\\314E","ㅎ");
		}
		for(int i=0;i<nmdiv.length();i++) {
			if(nmdiv.charAt(i)=='ᄀ') {
				result+="ㄱ";
			}else if(nmdiv.charAt(i)=='ᆨ') {
				result+="ㄱ";
			}else if(nmdiv.charAt(i)=='ᄂ') {
				result+="ㄴ";
			}else if(nmdiv.charAt(i)=='ᆫ') {
				result+="ㄴ";
			}else if(nmdiv.charAt(i)=='ᄃ') {
				result+="ㄷ";
			}else if(nmdiv.charAt(i)=='ᆮ') {
				result+="ㄷ";
			}else if(nmdiv.charAt(i)=='ᄅ') {
				result+="ㄹ";
			}else if(nmdiv.charAt(i)=='ᆯ') {
				result+="ㄹ";
			}else if(nmdiv.charAt(i)=='ᄆ') {
				result+="ㅁ";
			}else if(nmdiv.charAt(i)=='ᆷ') {
				result+="ㅁ";
			}else if(nmdiv.charAt(i)=='ᄇ') {
				result+="ㅂ";
			}else if(nmdiv.charAt(i)=='ᆸ') {
				result+="ㅂ";
			}else if(nmdiv.charAt(i)=='ᄉ') {
				result+="ㅅ";
			}else if(nmdiv.charAt(i)=='ᆺ') {
				result+="ㅅ";
			}else if(nmdiv.charAt(i)=='ᄋ') {
				result+="ㅇ";
			}else if(nmdiv.charAt(i)=='ᆼ') {
				result+="ㅇ";
			}else if(nmdiv.charAt(i)=='ᄌ') {
				result+="ㅈ";
			}else if(nmdiv.charAt(i)=='ᆽ') {
				result+="ㅈ";
			}else if(nmdiv.charAt(i)=='ᄎ') {
				result+="ㅊ";
			}else if(nmdiv.charAt(i)=='ᆾ') {
				result+="ㅊ";
			}else if(nmdiv.charAt(i)=='ᄏ') {
				result+="ㅋ";
			}else if(nmdiv.charAt(i)=='ᆿ') {
				result+="ㅋ";
			}else if(nmdiv.charAt(i)=='ᄐ') {
				result+="ㅌ";
			}else if(nmdiv.charAt(i)=='ᇀ') {
				result+="ㅌ";
			}else if(nmdiv.charAt(i)=='ᄑ') {
				result+="ㅍ";
			}else if(nmdiv.charAt(i)=='ᇁ') {
				result+="ㅍ";
			}else if(nmdiv.charAt(i)=='ᄒ') {
				result+="ㅎ";
			}else if(nmdiv.charAt(i)=='ᇂ') {
				result+="ㅎ";
			}else if(nmdiv.charAt(i)=='ᅡ') {
				result+="ㅏ";
			}else if(nmdiv.charAt(i)=='ᅣ') {
				result+="ㅑ";
			}else if(nmdiv.charAt(i)=='ᅥ') {
				result+="ㅓ";
			}else if(nmdiv.charAt(i)=='ᅧ') {
				result+="ㅕ";
			}else if(nmdiv.charAt(i)=='ᅩ') {
				result+="ㅗ";
			}else if(nmdiv.charAt(i)=='ᅭ') {
				result+="ㅛ";
			}else if(nmdiv.charAt(i)=='ᅮ') {
				result+="ㅜ";
			}else if(nmdiv.charAt(i)=='ᅲ') {
				result+="ㅠ";
			}else if(nmdiv.charAt(i)=='ᅳ') {
				result+="ㅡ";
			}else if(nmdiv.charAt(i)=='ᅵ') {
				result+="ㅣ";
			}else if(nmdiv.charAt(i)=='ᅢ') {
				result+="ㅐ";
			}else if(nmdiv.charAt(i)=='ᅤ') {
				result+="ㅒ";
			}else if(nmdiv.charAt(i)=='ᅦ') {
				result+="ㅔ";
			}else if(nmdiv.charAt(i)=='ᅨ') {
				result+="ㅖ";
			}else if(nmdiv.charAt(i)=='ᅬ') {
				result+="ㅚ";
			}else if(nmdiv.charAt(i)=='ᅫ') {
				result+="ㅙ";
			}else if(nmdiv.charAt(i)=='ᅱ') {
				result+="ㅟ";
			}else if(nmdiv.charAt(i)=='ᅴ') {
				result+="ㅢ";
			}else if(nmdiv.charAt(i)=='ᄁ') {
				result+="ㄲ";
			}else if(nmdiv.charAt(i)=='ᆩ') {
				result+="ㄲ";
			}else if(nmdiv.charAt(i)=='ᄄ') {
				result+="ㄸ";
			}else if(nmdiv.charAt(i)=='ᄈ') {
				result+="ㅃ";
			}else if(nmdiv.charAt(i)=='ᄊ') {
				result+="ㅆ";
			}else if(nmdiv.charAt(i)=='ᆻ') {
				result+="ㅆ";
			}else if(nmdiv.charAt(i)=='ᄍ') {
				result+="ㅉ";
			}else if(nmdiv.charAt(i)=='ᆪ') {
				result+="ㄳ";
			}else if(nmdiv.charAt(i)=='ᆬ') {
				result+="ㄵ";
			}else if(nmdiv.charAt(i)=='ᆭ') {
				result+="ㄶ";
			}else if(nmdiv.charAt(i)=='ᆰ') {
				result+="ㄺ";
			}else if(nmdiv.charAt(i)=='ᆱ') {
				result+="ㄻ";
			}else if(nmdiv.charAt(i)=='ᆲ') {
				result+="ㄼ";
			}else if(nmdiv.charAt(i)=='ᆳ') {
				result+="ㄽ";
			}else if(nmdiv.charAt(i)=='ᆴ') {
				result+="ㄾ";
			}else if(nmdiv.charAt(i)=='ᆶ') {
				result+="ㅀ";
			}else if(nmdiv.charAt(i)=='ᆹ') {
				result+="ㅄ";
			}else if(nmdiv.charAt(i)=='＃') {
				result+="";
			}else if(nmdiv.charAt(i)==' ') {
				result+=" ";
			}else {
				result+=isEnglish(nmdiv.charAt(i));
			}
		}
		return result;
	}

	private String isEnglish(char charAt) {
		String uniAlphabet="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		for(int i=0;i<uniAlphabet.length();i++) {
			if(uniAlphabet.charAt(i)==charAt)
				return charAt+""; 
		}
		return "";
	}
}