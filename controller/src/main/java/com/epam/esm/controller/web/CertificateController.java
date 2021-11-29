package com.epam.esm.controller.web;


import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.dao.model.Criteria;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.CertificateService;
import com.epam.esm.service.model.dto.CertificateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import javax.validation.constraints.Min;
import java.util.List;


@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/certificates")
@Validated
public class CertificateController {

    private final CertificateService certificateService;
    private final Linker<CertificateDto> certificateDtoLinker;

    @GetMapping
    public PageOfEntities<CertificateDto> getCertificates(@RequestParam(name = "tagName", required = false) List<String> tagNames,
                                                          @RequestParam(defaultValue = "", name = "partName", required = false) String partName,
                                                          @RequestParam(defaultValue = "id", name = "sortBy", required = false) String sortBy,
                                                          @RequestParam(defaultValue = "ASC", name = "order", required = false) String order,
                                                          @Min(1) @RequestParam(required = false, defaultValue = "1") int pageNumber) {

        PageOfEntities<CertificateDto> pageOfCertificates = certificateService.sortAllWithCriteria(new Criteria(sortBy, order, partName, tagNames), pageNumber);
        pageOfCertificates.getCurPage().forEach((certificateDtoLinker::addLinks));
        return pageOfCertificates;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public CertificateDto createCertificate(@Valid @RequestBody CertificateDto certificate) {
        CertificateDto createdCertificate = certificateService.create(certificate);
        certificateDtoLinker.addLinks(createdCertificate);
        return createdCertificate;
    }

    @GetMapping("/{id}")
    public CertificateDto getCertificate(@PathVariable Long id) {
        CertificateDto certificate = certificateService.findById(id);
        certificateDtoLinker.addLinks(certificate);
        return certificate;
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteCertificate(@PathVariable Long id) {
        certificateService.remove(id);
    }

    @PatchMapping("/{id}")
    public CertificateDto updateCertificate(@PathVariable Long id,
                                            @RequestBody CertificateDto certificate) {
        CertificateDto updatedCertificate = certificateService.update(id, certificate);
        certificateDtoLinker.addLinks(updatedCertificate);
        return updatedCertificate;
    }
}
