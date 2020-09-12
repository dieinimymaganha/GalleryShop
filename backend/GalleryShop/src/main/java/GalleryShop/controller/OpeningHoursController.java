package GalleryShop.controller;

import GalleryShop.controller.dto.OpeningHoursDto;
import GalleryShop.controller.form.OpeningHoursForm;
import GalleryShop.model.OpeningHours;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.OpeningHoursRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.net.URI;
import java.util.List;
import java.util.Optional;

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

    @GetMapping("/employee={id}")
    public List<OpeningHoursDto> getListOpeningHoursEmployee(@PathVariable Long id) {
        List<OpeningHours> openingHours = openingHoursRepository.findByEmployeeId(id);

        return OpeningHoursDto.converter(openingHours);
    }

    @PostMapping
    @Transactional
    public ResponseEntity<OpeningHoursDto> createNewOpening(@RequestBody @Valid OpeningHoursForm form,
                                                            UriComponentsBuilder uriBuilder) {
        OpeningHours opening = form.converter(employeeRepository);

        List<OpeningHours> openingHoursRecover = openingHoursRepository.findByEmployeeId(opening.getEmployee().getId());

        if (!openingHoursRecover.isEmpty()) {
            for (OpeningHours openingHours : openingHoursRecover) {
                if (opening.getDayOfTheWeek() == openingHours.getDayOfTheWeek()) {
                    return ResponseEntity.status(HttpStatus.CONFLICT).build();
                }

            }
        }
        openingHoursRepository.save(opening);
        URI uri = uriBuilder.path("/openinghours/{id}").buildAndExpand(opening.getId()).toUri();
        return ResponseEntity.created(uri).body(new OpeningHoursDto(opening));

    }

    @PutMapping("/{id}")
    @Transactional
    public ResponseEntity<OpeningHoursDto> updateOpeningHours(@PathVariable Long id, @RequestBody @Valid OpeningHoursForm form) {
        Optional<OpeningHours> optional = openingHoursRepository.findById(id);

        if (optional.isPresent()) {
            OpeningHours openingHours = form.upload(id, employeeRepository, openingHoursRepository);
            return ResponseEntity.ok(new OpeningHoursDto(openingHours));
        }
        return ResponseEntity.notFound().build();
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