package com.goodee.bacademy.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.goodee.bacademy.vo.WishList;

@Mapper
public interface StudentWishListMapper {
	public List<WishList> getMyWishList();
}
