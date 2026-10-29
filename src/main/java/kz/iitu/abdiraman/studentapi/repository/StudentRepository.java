package kz.iitu.abdiraman.studentapi.repository;

import kz.iitu.abdiraman.studentapi.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, Long> {
}
