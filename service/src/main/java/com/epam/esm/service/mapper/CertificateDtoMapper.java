package com.epam.esm.service.mapper;

import com.epam.esm.dao.model.Certificate;
import com.epam.esm.service.model.dto.CertificateDto;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@Component
public class CertificateDtoMapper implements Mapper<Certificate, CertificateDto> {

    private static final String DATE_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss";
    private final DateTimeFormatter formatterToString = DateTimeFormatter.ofPattern(DATE_TIME_PATTERN);
    private final DateTimeFormatter formatterToLocalDateTime = DateTimeFormatter.ofPattern(DATE_TIME_PATTERN);

    @Override
    public Certificate toEntity(CertificateDto certificateDto) {
        if (certificateDto == null) {
            return null;
        }
        Certificate certificate = Certificate.builder()
                .name(certificateDto.getName())
                .description(certificateDto.getDescription())
                .createDate(certificateDto.getCreateDate() == null ? null :
                        LocalDateTime.parse(certificateDto.getCreateDate(), formatterToLocalDateTime))
                .lastUpdateDate(certificateDto.getLastUpdateDate() == null ? null :
                        LocalDateTime.parse(certificateDto.getLastUpdateDate(), formatterToLocalDateTime))
                .duration(certificateDto.getDuration())
                .price(certificateDto.getPrice())
                .build();
        certificate.setId(certificateDto.getId());
        return certificate;
    }

    @Override
    public CertificateDto toDTO(Certificate certificate) {
        if (certificate == null) {
            return null;
        }
        return CertificateDto.builder()
                .id(certificate.getId())
                .name(certificate.getName())
                .description(certificate.getDescription())
                .createDate(certificate.getCreateDate().format(formatterToString))
                .lastUpdateDate(certificate.getLastUpdateDate().format(formatterToString))
                .duration(certificate.getDuration())
                .price(certificate.getPrice())
                .tags(new ArrayList<>())
                .build();
    }
}
