package GalleryShop.controller;

import java.net.URI;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import GalleryShop.controller.dto.OpeningHoursDto;
import GalleryShop.controller.form.OpeningHoursForm;
import GalleryShop.model.OpeningHours;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.OpeningHoursRepository;

@RestController
@RequestMapping("/openinghours")
public class OpeningHoursController {

    @Autowired
    EmployeeRepository employeeRepository;

    @Autowired
    OpeningHoursRepository openingHoursRepository;

    @GetMapping
    public List<OpeningHoursDto> getAll() {
        List<OpeningHours> openingHours = openingHoursRepository.findAll();
        return OpeningHoursDto.converter(openingHours);

    }

    @PostMapping
    @Transactional
    public ResponseEntity<OpeningHoursDto> createNewSchedule(@RequestBody @Valid OpeningHoursForm form,
            UriComponentsBuilder uriBuilder) {
        OpeningHours schedule = form.converter(employeeRepository);

        openingHoursRepository.save(schedule);

        URI uri = uriBuilder.path("/openinghours/{id}").buildAndExpand(schedule.getId()).toUri();

        return ResponseEntity.created(uri).body(new OpeningHoursDto(schedule));

    }

    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity<?> deleteSchedule(@PathVariable Long id) {
        Optional<OpeningHours> optional = openingHoursRepository.findById(id);

        if (optional.isPresent()) {
            openingHoursRepository.deleteById(id);
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.notFound().build();
    }

}