package com.epam.esm.controller.web;


import com.epam.esm.controller.hateoas.Linker;
import com.epam.esm.service.CertificateService;
import com.epam.esm.service.model.dto.CertificateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;


@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/certificates")
@Validated
public class CertificateController {

    private final CertificateService certificateService;

    @GetMapping
    public List<CertificateDto> getCertificates(@RequestParam(name = "tagName", required = false) String tagName,
                                                @RequestParam(defaultValue = "", name = "partName", required = false) String partName,
                                                @RequestParam(defaultValue = "id", name = "sortBy", required = false) String sortBy,
                                                @RequestParam(defaultValue = "ASC", name = "order", required = false) String order) {

        List<CertificateDto> certificates = certificateService.sortAllWithCriteria(sortBy, order, partName, tagName);
        certificates.forEach((Linker::addLinks));
        return certificates;
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public CertificateDto createCertificate(@Valid @RequestBody CertificateDto certificate) {
        CertificateDto createdCertificate = certificateService.create(certificate);
        Linker.addLinks(createdCertificate);
        return createdCertificate;
    }

    @GetMapping("/{id}")
    public CertificateDto getCertificate(@PathVariable Long id) {
        CertificateDto certificate = certificateService.findById(id);
        Linker.addLinks(certificate);
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
        Linker.addLinks(updatedCertificate);
        return updatedCertificate;
    }
}
