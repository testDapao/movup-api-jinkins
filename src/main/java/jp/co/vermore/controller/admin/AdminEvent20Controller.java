package jp.co.vermore.controller.admin;

import jp.co.vermore.common.Constant;
import jp.co.vermore.common.DatatablesJsonObject;
import jp.co.vermore.common.JsonObject;
import jp.co.vermore.common.JsonStatus;
import jp.co.vermore.common.mvc.APIException;
import jp.co.vermore.common.mvc.BaseController;
import jp.co.vermore.common.util.DateUtil;
import jp.co.vermore.common.util.StringUtil;
import jp.co.vermore.entity.*;
import jp.co.vermore.form.CategoryRegistForm;
import jp.co.vermore.form.EventRegistForm;
import jp.co.vermore.form.admin.CategorySearchForm;
import jp.co.vermore.form.admin.EventListForm;
import jp.co.vermore.form.admin.NewsForm;
import jp.co.vermore.form.admin.NewsListForm;
import jp.co.vermore.service.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * EventAdminController
 * Created by xieyoujun.
 * <p>
 * DateTime: 2018/03/15 18:22
 * Copyright: sLab, Corp
 */

@Controller
public class AdminEvent20Controller extends BaseController {

    @Autowired
    private EventService eventService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private PlatformTransactionManager txManager;

    @Autowired
    private AWSService awsService;

    @Autowired
    private EntryService entryService;

    @Autowired
    private PicService picService;

    @Autowired
    private AdminNewsController newsController;

    // Event admin list
    @RequestMapping(value = "/admin/event20/list/", method = RequestMethod.GET)
    public String eventList(Model model,HttpServletRequest request) {

        int errorCode = 0;
        if(!request.getSession().isNew()){
            if(request.getSession().getAttribute("error") != null && request.getSession().getAttribute("error") != ""){
                errorCode = (int)request.getSession().getAttribute("error");
                request.getSession().setAttribute("error",0);
            }
        }
        model.addAttribute("errorCode", errorCode);

        List<Event> List = eventService.getEventAll(10l, 0l);
        logger.info("------------getメソッド");
        model.addAttribute("event_list", List);
        return "admin/eventList20" +
                "" +
                "";
    }


    @RequestMapping(value = "/admin/event20/list/", method = RequestMethod.POST)
    @ResponseBody
    public DatatablesJsonObject eventList(@RequestBody EventListForm form){
        logger.debug("----postメソッド----1----{}", form);
        // set order statement
        if(form.getOrder().size() > 0
                && form.getColumns().get(form.getOrder().get(0).getColumn()).getName() != null
                && form.getColumns().get(form.getOrder().get(0).getColumn()).getName().length() > 0){
            form.setOrderStatement(form.getColumns().get(form.getOrder().get(0).getColumn()).getName() + " " + form.getOrder().get(0).getDir());
            logger.debug("----2----order statement="+form.getOrderStatement());
        }else{
            form.setOrderStatement("id");
            logger.debug("----2----order statement="+form.getOrderStatement());
        }
        logger.debug("----3----");

        // query data
        //List<Event> dataList = eventService.getEventAllByCondition(form);
        //ArrayList<Category> dataList = new ArrayList<>();
        List<Category> dataList = null;
        if (form.getTitle()!=null && !form.getTitle().equals("")){
            dataList = newsService.getCategoryByTitle(form.getTitle());
        }else {
            dataList = newsService.getCategory();
        }
        logger.info("---datalist:{}"+dataList);
        int totalCountFiltered = eventService.getEventCountByCondition(form);
        int totalCount = eventService.getEventCount();
        logger.debug("----4----data count="+dataList.size());
        logger.debug("----5----total filtered="+totalCountFiltered);
        logger.debug("----6----total count="+totalCount);
        logger.debug("----7----page="+form.getDraw());

//        for(Event event:dataList){
//            EntryMail entity = entryService.getEntryMailByEntryIdAndType( event.getId(),Constant.ENTRY__MAIL_TYPE.EVENT);
//            event.setType((int)Constant.ENTRY__MAIL_TYPE.EVENT);
//            if(entity != null){
//                event.setEntryType(1);//応募可能
//            }else{
//                event.setEntryType(0);//応募できない
//            }
//        }
        // return json data
        DatatablesJsonObject jsonparse = new DatatablesJsonObject();
        jsonparse.setDraw(form.getDraw());
        jsonparse.setRecordsFiltered(totalCountFiltered);
        jsonparse.setRecordsTotal(totalCount);
        jsonparse.setData(dataList);
        logger.debug("----8----");
        return jsonparse;
    }

    // Event admin detail
    @RequestMapping(value = "/admin/event20/detail/", method = RequestMethod.GET)
    public String eventRegistInput() {
//        EventRegistForm eventRegistForm = new EventRegistForm();
//        model.addAttribute("eventRegistForm", eventRegistForm);
        return "redirect:/admin/news/list/";
    }

    // Event admin add
    @RequestMapping(value = "/admin/event20/regist/", method = RequestMethod.GET)
    public String eventRegistadd(Model model) {
        EventRegistForm eventRegistForm = new EventRegistForm();
        model.addAttribute("eventRegistForm", eventRegistForm);
        return "admin/eventRegist20";
    }
    // Search
    @RequestMapping(value = "/admin/event20/searchByclo/", method = RequestMethod.GET)
    @ResponseBody
    public String eventRegistadd(Map datatable) {

//        String categoryName = form.getTitle();

        logger.info("【【【【categoryName:{}",datatable);

        return "redirect:/admin/event20/list/";
    }

    // Event admin add
    @RequestMapping(value = "/admin/category/regist/", method = RequestMethod.POST)
    public String eventRegist(@ModelAttribute CategoryRegistForm form, Model model, HttpServletRequest request) throws APIException{
        HttpSession session = request.getSession();
        logger.info("-----form:{}"+form);
        String maxtype = newsService.getCategoryMaxType() + "";
        Integer max = Integer.parseInt(maxtype)+1;
        NewsForm newsForm = new NewsForm();
        newsForm.setType(Byte.parseByte(max+""));
        newsForm.setDate(DateUtil.getNow());
        newsForm.setSortScore(0);
        newsForm.setTitle("--------なし--------");
        newsForm.setDetail(form.getTitle());
        newsForm.setExcerpt(" ");
        newsService.insertNews(newsForm);
        // upload files
//        try {
//            if (!form.getPicFile().isEmpty()) {
//                //form.setPicUrl(awsService.postMiddleThumbnailFile(form.getPicFile()));
//                form.setPicUrl(awsService.postFile(form.getPicFile()));
//            }
//            session.setAttribute("error",0);
//        }catch (IOException e) {
//            session.setAttribute("error",1);
//            throw new APIException(JsonStatus.DATA_SAVE_FAILED);
//        }
//
//        // トランザクション管理の開始
//        DefaultTransactionDefinition txDefinition = new DefaultTransactionDefinition();
//        txDefinition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
//        TransactionStatus txStatus = txManager.getTransaction(txDefinition);
//        try {
//            Long eventId = eventService.insertEvent(form);
//            Long countDetail = eventService.insertEventDetail(form, eventId);
//
//            MultipartFile[] star = form.getPicFile1();
//            Pic starPic = new Pic();
//            if (star.length>0) {
//                for(int i = 0 ; i < star.length; i++){
//                    starPic.setPicUrl(awsService.postWatermarkFile(request,star[i]));
//                    starPic.setItemId(eventId);
//                    starPic.setItemType(Constant.EVENT_PIC_TYPE.STAR);
//                    picService.insertPic(starPic);
//                }
//            }
//
//            MultipartFile[] comment = form.getPicFile2();
//            Pic commentPic = new Pic();
//            if (comment[0].getSize()>0) {
//                for(int i = 0 ; i < comment.length; i++){
//                    commentPic.setPicUrl(awsService.postWatermarkFile(request,comment[i]));
//                    commentPic.setItemId(eventId);
//                    commentPic.setItemType(Constant.EVENT_PIC_TYPE.COMMENT);
//                    picService.insertPic(commentPic);
//                }
//            }
//            txManager.commit(txStatus);
//            session.setAttribute("error",0);
//        } catch (Exception e) {
//            txManager.rollback(txStatus);
//            session.setAttribute("error",1);
//            logger.error("insert Event failed, error=" + e.getMessage());
//            logger.error("insert Event failed, error=" + e.toString());
//            e.printStackTrace();
//        }
        return "redirect:/admin/event20/list/";
    }
//
//    // Event admin add execution
//    @RequestMapping(value = "/admin/event/regist/", method = RequestMethod.POST)
//    public String eventRegist(@ModelAttribute EventRegistForm form, Model model,HttpServletRequest request) throws APIException{
//        HttpSession session = request.getSession();
//        // upload files
//        try {
//            if (!form.getPicFile().isEmpty()) {
//                //form.setPicUrl(awsService.postMiddleThumbnailFile(form.getPicFile()));
//                form.setPicUrl(awsService.postFile(form.getPicFile()));
//            }
//            session.setAttribute("error",0);
//        }catch (IOException e) {
//            session.setAttribute("error",1);
//            throw new APIException(JsonStatus.DATA_SAVE_FAILED);
//        }
//
//        // トランザクション管理の開始
//        DefaultTransactionDefinition txDefinition = new DefaultTransactionDefinition();
//        txDefinition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
//        TransactionStatus txStatus = txManager.getTransaction(txDefinition);
//        try {
//            Long eventId = eventService.insertEvent(form);
//            Long countDetail = eventService.insertEventDetail(form, eventId);
//
//            MultipartFile[] star = form.getPicFile1();
//            Pic starPic = new Pic();
//            if (star.length>0) {
//                for(int i = 0 ; i < star.length; i++){
//                    starPic.setPicUrl(awsService.postWatermarkFile(request,star[i]));
//                    starPic.setItemId(eventId);
//                    starPic.setItemType(Constant.EVENT_PIC_TYPE.STAR);
//                    picService.insertPic(starPic);
//                }
//            }
//
//            MultipartFile[] comment = form.getPicFile2();
//            Pic commentPic = new Pic();
//            if (comment[0].getSize()>0) {
//                for(int i = 0 ; i < comment.length; i++){
//                    commentPic.setPicUrl(awsService.postWatermarkFile(request,comment[i]));
//                    commentPic.setItemId(eventId);
//                    commentPic.setItemType(Constant.EVENT_PIC_TYPE.COMMENT);
//                    picService.insertPic(commentPic);
//                }
//            }
//            txManager.commit(txStatus);
//            session.setAttribute("error",0);
//        } catch (Exception e) {
//            txManager.rollback(txStatus);
//            session.setAttribute("error",1);
//            logger.error("insert Event failed, error=" + e.getMessage());
//            logger.error("insert Event failed, error=" + e.toString());
//            e.printStackTrace();
//        }
//        return "redirect:/admin/event/list/";
//    }
//
//    // Event admin edit show
//    @RequestMapping(value = "/admin/event/edit/{id}/", method = RequestMethod.GET)
//    public String eventEdit(Model model, @PathVariable Long id) {
//        EventRegistForm eventRegistForm = new EventRegistForm();
//
//        Event event = eventService.getById(id);
//        eventRegistForm.setEventId(event.getId());
//        eventRegistForm.setExcerpt(event.getExcerpt());
//        eventRegistForm.setPicListNo(event.getPicListNo());
//        eventRegistForm.setPicUrl(event.getPicUrl());
//        eventRegistForm.setPublishStart(DateUtil.dateToStringyyyy_MM_dd(event.getPublishStart()));
//        eventRegistForm.setPublishEnd(DateUtil.dateToStringyyyy_MM_dd(event.getPublishEnd()));
//
//        EventDetail eventDetail = eventService.getEventDetailByEventId(id);
//        eventRegistForm.setEventDetailId(eventDetail.getId());
//        eventRegistForm.setTitle(eventDetail.getTitle());
//        eventRegistForm.setGustName(eventDetail.getGuestName());
//        eventRegistForm.setHallName(eventDetail.getHallName());
//        eventRegistForm.setComment(eventDetail.getComment());
//        eventRegistForm.setDesc1(eventDetail.getDesc1());
//        eventRegistForm.setExcerpt(event.getExcerpt());
//        eventRegistForm.setSortScore(String.valueOf(event.getSortScore()));
//        eventRegistForm.setHoldDate(DateUtil.dateToStringyyyy_MM_dd(eventDetail.getHoldDate()));
//
//        eventRegistForm.setVideoUrl1(eventDetail.getVideoUrl1());
//
//        List<Pic> starPicList = picService.getPic(id,Constant.EVENT_PIC_TYPE.STAR);
//        List<String> starList = new ArrayList<String>();
//        for(Pic pic:starPicList){
//            starList.add(pic.getPicUrl());
//        }
//        eventRegistForm.setPicUrl1(starList);
//        List<Pic> commentPicList = picService.getPic(id,Constant.EVENT_PIC_TYPE.COMMENT);
//        List<String> commentList = new ArrayList<String>();
//        for(Pic pic:commentPicList){
//            commentList.add(pic.getPicUrl());
//        }
//        eventRegistForm.setPicUrl2(commentList);
//        model.addAttribute("eventRegistForm", eventRegistForm);
//        return "admin/eventEdit";
//    }
//
//    // Event admin edit post
//    @RequestMapping(value = "/admin/event/update/", method = RequestMethod.POST)
//    public String eventUpdate(@ModelAttribute EventRegistForm form,HttpServletRequest request) throws APIException{
//        // upload files
//        HttpSession session = request.getSession();
//        try {
//            if (!form.getPicFile().isEmpty()) {
//                form.setPicUrl(awsService.postFile(form.getPicFile()));
//            }
//            session.setAttribute("error",0);
//        }catch (IOException e) {
//            session.setAttribute("error",1);
//            throw new APIException(JsonStatus.DATA_SAVE_FAILED);
//        }
//
//        // トランザクション管理の開始
//        DefaultTransactionDefinition txDefinition = new DefaultTransactionDefinition();
//        txDefinition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
//        TransactionStatus txStatus = txManager.getTransaction(txDefinition);
//        try {
//            Event event = eventService.updateEvent(form);
//            eventService.updateEventDetail(form);
//
//            txManager.commit(txStatus);
//            session.setAttribute("error",0);
//        } catch (Exception e) {
//            txManager.rollback(txStatus);
//            session.setAttribute("error",1);
//            logger.error("Update Event failed!, error=" + e.getMessage());
//            logger.error("Update Event failed!, error=" + e.toString());
//            e.printStackTrace();
//        }
//        return "redirect:/admin/event/list/";
//    }
//
    // Event admin delete
    @RequestMapping(value = "/admin/event20/delete/", method = RequestMethod.POST)
    public String eventDelete(HttpServletRequest hsr,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Long eventId = Long.valueOf(hsr.getParameterValues("categoryType")[0]);
        logger.info("--------id:{}",eventId);

        // トランザクション管理の開始
        DefaultTransactionDefinition txDefinition = new DefaultTransactionDefinition();
        txDefinition.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus txStatus = txManager.getTransaction(txDefinition);
        try {
            Byte type = eventId.byteValue();
            newsService.deleteNewsByType(type);
//            NewsForm newsForm = new NewsForm();
//            newsForm.setType(eventId.byteValue());
//            int i = newsService.deleteNews(newsForm);
//            eventService.deleteEvent(eventId);
//            session.setAttribute("error",0);
//            EventDetail eventDetail = eventService.getEventDetailByEventId(eventId);
//            eventService.deleteEventDetail(eventDetail.getEventId());
            txManager.commit(txStatus);
        } catch (Exception e) {
            txManager.rollback(txStatus);
            session.setAttribute("error",1);
        }
        return "redirect:/admin/event20/list/";
    }

    @GetMapping("/admin/event20/news/{id}")
    @ResponseBody
    public DatatablesJsonObject evenews(@PathVariable("id") Long id){
//        System.out.println(id);
        logger.info("リクエストのIDは：{}",id);
        NewsListForm newsListForm = new NewsListForm();
        newsListForm.setDraw(2);
        newsListForm.setType(id.toString());
        //newsController.newsList(newsListForm);
        return null;
    }

}
