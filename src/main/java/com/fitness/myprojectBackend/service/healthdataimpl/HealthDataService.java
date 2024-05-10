package com.fitness.myprojectBackend.service.healthdataimpl;

import com.fitness.myprojectBackend.dto.HealthDataDto;
import com.fitness.myprojectBackend.entity.HealthData;
import com.fitness.myprojectBackend.mapper.HealthDataMapper;
import com.fitness.myprojectBackend.repositry.HealthDataRepo;
import com.fitness.myprojectBackend.service.HealthDataSer;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class HealthDataService implements HealthDataSer {

    @Autowired
    private HealthDataRepo hdrepo;

    @Autowired
    private HealthDataMapper hdmapper;

    @Override
    public HealthDataDto submitHealthData(int id,HealthDataDto healthDataDto) {

        HealthData hd =hdmapper.toEntity(Math.toIntExact(id),healthDataDto);
        HealthData saved = hdrepo.save(hd);
        return hdmapper.toDto(saved);

    }


    @Override
    public HealthDataDto getLatestHealthData(Long userId) {
        List<HealthData> healthData=hdrepo.findByUserIdOrderByIdDesc(Math.toIntExact(userId));
        if(!healthData.isEmpty()){
            HealthData latest=healthData.get(0);
            return hdmapper.toDto(latest);
        }
        else {
            throw new EntityNotFoundException("No health data found for user id "+userId);
        }
    }

    @Override
    public List<HealthDataDto> getAllHealthData(Long userId) {
        List<HealthData> healthData=hdrepo.findByUserId(Math.toIntExact(userId));
        return healthData.stream().map(hdmapper::toDto).collect(Collectors.toList());

    }
}
