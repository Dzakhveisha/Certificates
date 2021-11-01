package com.epam.esm.controller;

import com.epam.esm.model.Certificate;
import com.epam.esm.service.impl.CertificateServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/certificates")
public class CertificateController {

    private final CertificateServiceImpl certificateService;

    @GetMapping
    public List<Certificate> getAllCertificates() {
        return certificateService.findAll();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Certificate createCertificate(@Valid @RequestBody Certificate certificate) {
        return certificateService.create(certificate);
    }

    @GetMapping("/{id}")
    public Certificate getCertificate(@PathVariable Long id) {
        return certificateService.findById(id);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteCertificate(@PathVariable Long id) {
        certificateService.remove(id);
    }

    @PutMapping("/{id}")
    @ResponseStatus(HttpStatus.OK)
    public Certificate updateCertificate(@PathVariable Long id, @Valid @RequestBody Certificate certificate) {
        return certificateService.update(id, certificate);
    }
}
