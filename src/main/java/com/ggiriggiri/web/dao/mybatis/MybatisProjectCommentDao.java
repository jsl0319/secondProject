package com.ggiriggiri.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggiriggiri.web.dao.ProjectCommentDao;
import com.ggiriggiri.web.entity.ProjectCommentView;
@Repository
public class MybatisProjectCommentDao implements ProjectCommentDao{

	@Autowired
	private SqlSession session;
	
	private ProjectCommentDao mapper;
	
	@Autowired
	public MybatisProjectCommentDao(SqlSession session) {
		
		mapper = session.getMapper(ProjectCommentDao.class);
	}

	@Override
	public List<ProjectCommentView> getViewListByBoardId(int boardId) {
		// TODO Auto-generated method stub
		return mapper.getViewListByBoardId(boardId);
	}
	
}
