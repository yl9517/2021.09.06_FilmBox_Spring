package com.film.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.film.dto.KakaopayDTO;
import com.film.dto.MovieDTO;
import com.film.dto.ReserveDTO;
import com.film.dto.ScreenDTO;
import com.film.dto.UserDTO;
import com.film.service.MovieService;
import com.film.service.ReserveService;
import com.film.service.UserService;

@Controller
public class ReserveContorller {
   @Resource(name = "movieservice")
   private MovieService service;


   @Resource(name = "reserveservice")
   private ReserveService reservice;

   @Autowired
   private UserService userservice;
   
//   @GetMapping("/reservemovie/{movieCd}/{movieNm}")
//    public String movieInfo(@PathVariable String movieCd,@PathVariable String movieNm, Model model, HttpSession session) {
//       
//
//       MovieDTO dto = service.getMovie(movieCd);
//       List<MovieDTO> mlist = reservice.getMovieList();
//        //세션아이디 받기
//       String member_id=(String)session.getAttribute("loginId");
//       
//       
//       String result = null;
//       if(member_id==null) {
//          result = "reserve/logincondition";
//       }else   {
//          model.addAttribute("key","03778b8e03b2f65d0d2c724260f2df8c");
//           model.addAttribute("dto",dto);
//           model.addAttribute("mlist",mlist);
//
//         model.addAttribute("page", "movie/movieRes.jsp");
//          
//          result = "view";
//       }
//       return result;
////       return "movie/movieRes";
//    }
   
   @RequestMapping(value="/reservemovie" , method = {RequestMethod.GET, RequestMethod.POST})
   public String movieInfo(MovieDTO dto, Model model, HttpSession session) {
       

       dto = service.getMovie(dto.getMovieCd());
       List<MovieDTO> mlist = reservice.getMovieList();
        //세션아이디 받기
       String member_id=(String)session.getAttribute("loginId");
       
       
       String result = null;
       if(member_id==null) {
          result = "reserve/logincondition";
       }else   {
          model.addAttribute("key","03778b8e03b2f65d0d2c724260f2df8c");
           model.addAttribute("dto",dto);
           model.addAttribute("mlist",mlist);

         model.addAttribute("page", "movie/movieRes.jsp");
          
          result = "view";
       }
       return result;
//       return "movie/movieRes";
    }
   
   
   
   @PostMapping("/seatchoice")
   public String seatchoice(KakaopayDTO dto, Model model, HttpSession session) {
      List<ScreenDTO> slist = new ArrayList<ScreenDTO>();
      
       String member_id=(String)session.getAttribute("loginId");
       String result = null;
       KakaopayDTO mv = reservice.getmoviecd(dto);
       
       String flag ="flag";
      if(dto.getSelectmovie().equals(flag)) { //영화선택
      }else {
         dto.setMovieCd(mv.getMovieCd());
         dto.setMovieNm(mv.getMovieNm());
      }
      
      if (member_id == null) {
         result = "reserve/logincondition";
      } else {
         UserDTO user = userservice.userDetail(member_id);
         model.addAttribute("user", user);
         
         slist = reservice.getseats(dto);
         model.addAttribute("reserve", dto);
         model.addAttribute("slist", slist);
         model.addAttribute("page", "movie/seatchoice.jsp");
         result = "view";
      }
      
      return result;
   }
   
   @RequestMapping("/kakaojsp")
   public String kakaojsp(KakaopayDTO dto,@RequestParam int ousepoint,Model model, HttpSession session) {

      
  //    System.out.println("사용포인트: "+ousepoint);
       String member_id=(String)session.getAttribute("loginId");
       String result = null;
       if(member_id==null) {
          result = "reserve/logincondition";
       }else   {
          model.addAttribute("dto",dto);
          model.addAttribute("usepoint",ousepoint);
          result = "kakao/kakao";
       }
      
      return result;
      
   }
   
   @GetMapping("/success/{payMoney}/{movieCd}/{screenTime}/{reserveDate}/{ticketNumber}/{selectedSeat}/{usepoint}")
   public String reserveSuccess(KakaopayDTO dto, HttpSession session) {
      String member_id=(String)session.getAttribute("loginId");
      dto.setMember_id(member_id); 
      reservice.reserveinsert(dto);
      
      String[] seats = dto.getSelectedSeat().split(",");


      List<ScreenDTO> sList = new ArrayList<ScreenDTO>();
      for(int i=0; i<seats.length; i++) {
              
          ScreenDTO sDTO = new ScreenDTO();

          sDTO.setRev_no(dto.getRev_no());
          sDTO.setReserveDate(dto.getReserveDate());
          sDTO.setScreenTime(dto.getScreenTime());
          sDTO.setSeats(seats[i]);

          reservice.screeninsert(sDTO);
      }
      
      return "redirect:/main";      
   }

   
}