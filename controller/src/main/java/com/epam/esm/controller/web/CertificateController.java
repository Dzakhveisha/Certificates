package com.epam.esm.controller.web;


import com.epam.esm.service.CertificateService;
import com.epam.esm.service.model.dto.CertificateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;


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

        return certificateService.sortAllWithCriteria(sortBy, order, partName, tagName);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public CertificateDto createCertificate(@Valid @RequestBody CertificateDto certificate) {
        return certificateService.create(certificate);
    }

    @GetMapping("/{id}")
    public CertificateDto getCertificate(@PathVariable Long id) {
        return certificateService.findById(id);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteCertificate(@PathVariable Long id) {
        certificateService.remove(id);
    }

    @PatchMapping("/{id}")
    public CertificateDto updateCertificate(@PathVariable Long id,
                                            @RequestBody CertificateDto certificate) {
        return certificateService.update(id, certificate);
    }
}
