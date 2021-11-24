package com.epam.esm.controller.hateoas;

import com.epam.esm.controller.web.CertificateController;
import com.epam.esm.controller.web.TagController;
import com.epam.esm.service.model.dto.CertificateDto;
import org.springframework.stereotype.Component;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@Component
public class CertificateDtoLinker implements Linker<CertificateDto> {
    @Override
    public void addLinks(CertificateDto certificate) {
        certificate.add(linkTo(CertificateController.class)
                .slash(certificate.getId())
                .withSelfRel());

        certificate.getTags()
                .forEach((tagDto -> certificate.add(linkTo(methodOn(TagController.class)
                        .getTag(tagDto.getId()))
                        .withRel("tags"))));
    }
}
