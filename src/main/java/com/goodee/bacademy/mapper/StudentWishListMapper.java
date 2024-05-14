package com.goodee.bacademy.mapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import com.goodee.bacademy.vo.WishListVO;

@Mapper
public interface StudentWishListMapper {
	public List<WishListVO> getMyWishList(String id);
	
	public int addWishList(Map<String,Object> wishMap);
	
	
	public int wishListDelete(Map<String,Object>wishMap);
}
