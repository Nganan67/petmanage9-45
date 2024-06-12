package org.example.petmanage1.repository;

import org.example.petmanage1.entity.Pet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PetRepository extends JpaRepository<Pet, Long> {
    //根据宠物ID查询宠物

    //根据主人ID查询宠物
    //支持分页显示pet列表请求
    //addPet()实现添加宠物请求
    //editPet()实现编辑更新宠物信息
    //deletePet()实现删除宠物信息
    List<Pet> findByOwnerId(Long id);
}
