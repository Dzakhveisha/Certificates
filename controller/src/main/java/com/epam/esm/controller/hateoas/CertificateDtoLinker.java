package com.epam.esm.controller.hateoas;

import com.epam.esm.controller.web.CertificateController;
import com.epam.esm.controller.web.TagController;
import com.epam.esm.dao.model.Criteria;
import com.epam.esm.dao.model.PageOfEntities;
import com.epam.esm.service.model.dto.CertificateDto;
import org.springframework.stereotype.Component;

import java.util.Collections;

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

    @Override
    public void addPaginationLinks(PageOfEntities<CertificateDto> page) {

    }

    @Override
    public void addPaginationLinks(PageOfEntities<CertificateDto> page, Criteria criteria) {
        if (page.getCurPageNumber() > 1) {
            if (criteria.getTagNames() != null) {
                page.add(linkTo(methodOn(CertificateController.class)
                        .getCertificates(criteria.getTagNames(), criteria.getPartName(), criteria.getSortBy(),
                                criteria.getOrder(), page.getCurPageNumber() - 1))
                        .withRel("PrevPage"));
            } else {
                page.add(linkTo(methodOn(CertificateController.class)
                        .getCertificates(Collections.emptyList(), criteria.getPartName(), criteria.getSortBy(),
                                criteria.getOrder(), page.getCurPageNumber() - 1))
                        .withRel("PrevPage"));
            }
        }
        if (page.getCurPageNumber() < page.getCountOfPages()) {
            if (criteria.getTagNames() != null) {
                page.add(linkTo(methodOn(CertificateController.class)
                        .getCertificates(criteria.getTagNames(), criteria.getPartName(), criteria.getSortBy(),
                                criteria.getOrder(), page.getCurPageNumber() + 1))
                        .withRel("NextPage"));
            } else {
                page.add(linkTo(methodOn(CertificateController.class)
                        .getCertificates(Collections.emptyList(), criteria.getPartName(), criteria.getSortBy(),
                                criteria.getOrder(), page.getCurPageNumber() + 1))
                        .withRel("NextPage"));
            }
        }
    }
}
