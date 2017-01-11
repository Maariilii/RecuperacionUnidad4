package boot.dao;

import org.springframework.data.repository.CrudRepository;

import boot.model.Mysql;


public interface MysqlRepository extends CrudRepository<Mysql,Integer> {

}
