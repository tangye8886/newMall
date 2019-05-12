package com.tangye.mall.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.stereotype.Component;

import com.alibaba.dubbo.config.annotation.Service;
import com.tangye.mall.entity.KeyWord;
import com.tangye.mall.entity.MallItem;
import com.tangye.mall.mapper.MallItemMapper;
import com.tangye.mall.service.ItemService;
import com.tangye.mall.utils.PageUtils;

@Service
@Component
public class ItemServiceImpl implements ItemService {

	@Resource
	MallItemMapper mapper;
	
	@Resource
	private SolrClient client;
	
	@Override
	public List<MallItem> allItem() {
		// TODO Auto-generated method stub
		return mapper.allItem();
	}

	@Override
	public MallItem findItemByid(long id) {
		// TODO Auto-generated method stub
		return mapper.findItemByid(id);
	}

	@Override
	public int deleteItem(long id) {
		// TODO Auto-generated method stub
		return mapper.deleteItem(id);
	}

	@Override
	public int updateItem(MallItem item) {
		return mapper.updateItem(item);
	}

	@Override
	public int addItem(MallItem item) {
		return mapper.addItem(item);
	}

	@Override
	public List<MallItem> sortItem(String title,String cat,String price,String sort) {
		List<MallItem> items=new ArrayList<MallItem>();
		SolrQuery params=new SolrQuery();
		
		if("".equals(title))  //空值查询所有
		{
			params.set("q","*:*");
		}
	
		//设置条件
		if(title!=null && !"".equals(title))
		{
			params.set("q","item_title:"+title);
		}
		
		if(cat!=null && !"".equals(cat))
		{
			params.set("fq","item_cid:"+cat);
		}
		
		if(price!=null && !"".equals(price))
		{
			String p[]=price.split("-");
			if(Integer.parseInt(p[0])<Integer.parseInt(p[1]))  //比较价格大小
			params.set("fq", "item_price:["+p[0]+" TO "+p[1]+"]");
			else params.set("fq", "item_price:["+p[1]+" TO "+p[0]+"]");
		}
		
		//1 :综合  2:销量升序 3:销量降序 4：价格升序  5：价格降序
		if(sort!=null && !"".equals(sort))
		{
			if(sort.equals("1")) {}
			if(sort.equals("2"))params.setSort("item_sell_num", ORDER.asc);
			if(sort.equals("3"))params.setSort("item_sell_num", ORDER.desc);
			if(sort.equals("4"))params.setSort("item_price", ORDER.asc);
			if(sort.equals("5"))params.setSort("item_price", ORDER.desc);
		}
		
		//params.set("df","item_keywords");
		//设置高光
		params.setHighlight(true);
		params.addHighlightField("item_title");
		params.setHighlightSimplePre("<span style='color:red'>");
		params.setHighlightSimplePost("</span>");
		//将商品的标题跟描述一起进行搜索匹配
		params.set("df","product_keywords");
		params.setRows(100);
		try {
			
			QueryResponse response = client.query(params);
			
			SolrDocumentList results = response.getResults();
			
			for(SolrDocument sd:results)
			{
				MallItem item=new MallItem();
				item.setId(Long.parseLong(sd.get("id").toString()));
				item.setImage((String)sd.get("item_image"));
				item.setSellNum(Integer.parseInt(sd.get("item_sell_num").toString()) );
				item.setPrice(Float.parseFloat(sd.get("item_price").toString()));
				item.setSellPoint((String)sd.get("item_sell_point"));
				item.setCid(Long.parseLong(sd.get("item_cid").toString()));
				Map<String, Map<String, List<String>>> highlighting = response.getHighlighting();
				Map<String, List<String>> map = highlighting.get(sd.get("id"));
				List<String> list = map.get("item_title");
				if(highlighting!=null && map!=null && list!=null)
				{
					item.setTitle(list.get(0));
				}else 
				{
					item.setTitle((String)sd.get("item_title"));
				}
				items.add(item);
			}
			
		} catch (SolrServerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return items;
	}

	@Override
	public void addSolrItem(MallItem item) {

		SolrInputDocument doc=new SolrInputDocument();
		doc.setField("id", item.getId());
		doc.setField("name", item.getTitle());
		doc.setField("item_image", item.getImage());
		doc.setField("item_sell_desc", item.getSellDesc());
		doc.setField("item_price", item.getPrice());
		doc.setField("item_sell_num", item.getNum());
		doc.setField("item_title", item.getTitle());
		doc.setField("item_cid", item.getCid());
		
		try {
			client.add(doc);
			client.commit();
		} catch (SolrServerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteSolrItem(String id) {
		try {
			client.deleteById(id);
			client.commit();
		} catch (SolrServerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<KeyWord> searchItemLike(String title) {
		// TODO Auto-generated method stub
		return mapper.searchItemLike(title);
	}

	@Override
	public Map<String, Object> sortItemPage(Integer pageIndex, String title, String cat, String price, String sort) {
		// TODO Auto-generated method stub
		Map<String, Object> maps=new HashMap<String,Object>();		
		List<MallItem> items=new ArrayList<MallItem>();
		
		SolrQuery params=new SolrQuery();
		
		if("".equals(title))  //空值查询所有
		{
			params.set("q","*:*");
		}
	
		//设置条件
		if(title!=null && !"".equals(title))
		{
			params.set("q","item_title:"+title);
		}
		
		if(cat!=null && !"".equals(cat))
		{
			params.set("fq","item_cid:"+cat);
		}
		
		if(price!=null && !"".equals(price))
		{
			String p[]=price.split("-");
			int from=0, to=0;
			if(Integer.parseInt(p[0])<Integer.parseInt(p[1])) 
			{
				from=Integer.parseInt(p[0]); to=Integer.parseInt(p[1]); 
			}else {
				from=Integer.parseInt(p[1]); to=Integer.parseInt(p[0]); 
			}
			from=from*100; to=to*100;
			params.set("fq", "item_price:["+from+" TO "+to+"]");
		}
		
		//1 :综合  2:升序 3:降序
		if(sort!=null && !"".equals(sort))
		{
			if(sort.equals("1")) {}
			if(sort.equals("2"))params.setSort("item_sell_num", ORDER.asc);
			if(sort.equals("3"))params.setSort("item_sell_num", ORDER.desc);
			if(sort.equals("4"))params.setSort("item_price", ORDER.asc);
			if(sort.equals("5"))params.setSort("item_price", ORDER.desc);
		}
		
		//将商品的标题跟描述一起进行搜索匹配
		params.set("df","product_keywords");
		
		//设置高光
		params.setHighlight(true);
		params.addHighlightField("item_title");
		params.setHighlightSimplePre("<span style='color:red'>");
		params.setHighlightSimplePost("</span>");

		params.setStart(((pageIndex-1)*PageUtils.PAGE_SIZE));//从哪里开始显示
		params.setRows(PageUtils.PAGE_SIZE);//每一行显示的条数
		
		
		try {
			QueryResponse response = client.query(params);
			SolrDocumentList results = response.getResults();
			
			maps.put("pages", PageUtils.getPages(results.getNumFound()));
			maps.put("totls", results.getNumFound());
			for(SolrDocument sd:results)
			{
				MallItem item=new MallItem();
				item.setId(Long.parseLong(sd.get("id").toString()));
				item.setImage((String)sd.get("item_image"));
				item.setSellNum(Integer.parseInt(sd.get("item_sell_num").toString()) );
				item.setPrice(Float.parseFloat(sd.get("item_price").toString()));
				item.setSellDesc((String)sd.get("item_sell_desc"));
				item.setCid(Long.parseLong(sd.get("item_cid").toString()));
				Map<String, Map<String, List<String>>> highlighting = response.getHighlighting();
				Map<String, List<String>> map = highlighting.get(sd.get("id"));
				List<String> list = map.get("item_title");
				if(highlighting!=null && map!=null && list!=null)
				{
					item.setTitle(list.get(0));
				}else 
				{
					item.setTitle((String)sd.get("item_title"));
				}
				items.add(item);
			}
			
		} catch (SolrServerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		maps.put("pList", items);

		return maps;
	}


}
