package com.epam.esm.dto.mapper;

import com.epam.esm.dto.CertificateDto;
import com.epam.esm.model.Certificate;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@Component
public class CertificateDtoMapper {

    private final DateTimeFormatter formatterToString = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    private final DateTimeFormatter formatterToLocalDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    public Certificate toEntity(CertificateDto certificateDto) {
        if (certificateDto == null) {
            return null;
        }
        Certificate certificate = Certificate.builder()
                .name(certificateDto.getName() == null ? null : certificateDto.getName())
                .description(certificateDto.getDescription() == null ? null : certificateDto.getDescription())
                .createDate(certificateDto.getCreateDate() == null ? null : LocalDateTime.parse(certificateDto.getCreateDate(),
                        formatterToLocalDateTime))
                .lastUpdateDate(certificateDto.getLastUpdateDate() == null ? null :LocalDateTime.parse(certificateDto.getLastUpdateDate(),
                        formatterToLocalDateTime))
                .duration(certificateDto.getDuration()== null ? null : certificateDto.getDuration())
                .price(certificateDto.getPrice() == null ? null : certificateDto.getPrice())
                .build();
        certificate.setId(certificateDto.getId());
        return certificate;
    }

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
