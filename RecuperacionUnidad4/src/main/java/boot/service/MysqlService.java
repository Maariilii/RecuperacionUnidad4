package boot.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import boot.dao.MysqlRepository;
import boot.model.Mysql;



@Service @Transactional
public class MysqlService {

	private final MysqlRepository mysqlRepository;

	public MysqlService(MysqlRepository mysqlRepository){
		super();
		this.mysqlRepository= mysqlRepository;
	}
	
	public List <Mysql> findAll(){
		List<Mysql> mysqls = new ArrayList<Mysql>();
		for(Mysql mysql : mysqlRepository.findAll() ){
			mysqls.add(mysql);
		}
		return mysqls;
	}
	
	public void save(Mysql mysql){
		mysqlRepository.save(mysql);
	}
	
	public void delete(int id){
		mysqlRepository.delete(id);
	}
	
	public  Mysql finOne(int id){
	return mysqlRepository.findOne(id);
	}
}
