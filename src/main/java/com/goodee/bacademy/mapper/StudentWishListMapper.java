package com.goodee.bacademy.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.goodee.bacademy.vo.WishListVO;

@Mapper
public interface StudentWishListMapper {
	public List<WishListVO> getMyWishList(String id);
	
	// 위시리스트 추가
	public int addWishList(Map<String,Object> wishMap);
	
	// 위시리스트 삭제
	public int wishListDelete(Map<String,Object>wishMap);
	
	// 수강 신청
	public int addApplication(Map<String,Object>wishMap);
}
