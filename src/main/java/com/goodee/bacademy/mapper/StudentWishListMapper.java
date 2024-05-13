package com.goodee.bacademy.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.goodee.bacademy.vo.WishListVO;

@Mapper
public interface StudentWishListMapper {
	public List<WishListVO> getMyWishList(String id);
}
