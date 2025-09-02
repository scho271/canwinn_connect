import 'package:canwinn_project/View/Ambulance_services.dart';
import 'package:canwinn_project/View/Bed_availability.dart';
import 'package:canwinn_project/View/BillPage.dart';
import 'package:canwinn_project/View/Confirmation_Appointment.dart';
import 'package:canwinn_project/View/dash_board/Dashboard.dart';
import 'package:canwinn_project/View/DcotorInformation.dart';
import 'package:canwinn_project/View/DoctorAppointment.dart';
import 'package:canwinn_project/View/Doctor_profile_screen.dart';
import 'package:canwinn_project/View/Emergency_Contacts.dart';
import 'package:canwinn_project/View/Hosptial_nearme.dart';
import 'package:canwinn_project/View/Login.dart';
import 'package:canwinn_project/View/Offers_page.dart';
import 'package:canwinn_project/View/Pharamacy_Screen.dart';
import 'package:canwinn_project/View/Registration.dart';
import 'package:canwinn_project/View/Splash.dart';
import 'package:canwinn_project/View/bottom_navigations_bar.dart';
import 'package:canwinn_project/View/doctor_appoiments/doctor_appoiments.dart';
import 'package:canwinn_project/View/services/services_list.dart';
import 'package:canwinn_project/View/verify_otp.dart';
import 'package:canwinn_project/View/view_detail_page.dart';
import 'package:canwinn_project/res/routes/routes_name.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static openRoutes() => [
    GetPage(name: RoutesName.splash, page: () => SplashScreen()),
    GetPage(name: RoutesName.login, page: () => LoginScreen()),
    GetPage(name: RoutesName.registration, page: () => RegistrationScreen()),
    GetPage(name: RoutesName.otp, page: () => VerfiyOtpScreens()),
    GetPage(
      name: RoutesName.bootomNav,
      page: () => BottomNavigationsBarScreens(),
    ),

    GetPage(name: RoutesName.dashboard, page: () => Dashboard()),
    GetPage(
      name: RoutesName.doctorAppointment,
      page: () => DoctorAppointmentScreen(),
    ),
    GetPage(
      name: RoutesName.doctorProfileCards,
      page: () => DoctorsAppointmentPage(),
    ),
    GetPage(name: RoutesName.doctorProfile, page: () => DoctorProfileScreen()),
    GetPage(name: RoutesName.billPage, page: () => ConfirmClinicVisitScreen()),
    GetPage(
      name: RoutesName.confirmationAppointment,
      page: () => AppointmentConfirmedScreen(),
    ),
    GetPage(
      name: RoutesName.ambulanceServices,
      page: () => AmbulanceServiceScreen(),
    ),
    GetPage(
      name: RoutesName.emergencyContacts,
      page: () => EmergencyContactsScreen(),
    ),
    GetPage(
      name: RoutesName.bedAvailability,
      page: () => BedAvailabilityScreen(),
    ),
    GetPage(name: RoutesName.pharmacy, page: () => PharmacyScreen()),
    // GetPage(name: RoutesName.hospitalNearMe, page: () => HospitalListScreen()),
    GetPage(
      name: RoutesName.hospitalDetailPage,
      page: () => HospitalDetailsScreen(),
    ),
    GetPage(name: RoutesName.offers, page: () => OffersScreen()),
    GetPage(name: RoutesName.services, page:() => ServiceListScreen(),)
  ];
}
