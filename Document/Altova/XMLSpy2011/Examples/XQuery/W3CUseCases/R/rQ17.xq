(:
XML Query Use Cases: http://www.w3.org/TR/xquery-use-cases/
Copyright �2003 World Wide Web Consortium, (Massachusetts Institute of Technology, European Research Consortium for Informatics and Mathematics, Keio University). All Rights Reserved. This work is distributed under the W3C� Software License [1] in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
[1] http://www.w3.org/Consortium/Legal/2002/copyright-software-20021231
 Filename: rQ17.xq :)

(: Section: 1.4.4.17 Q17  List the names of users, if any, who have bid on every item. :)

(: testing FO 15.4.4 fn:doc  testing XQ 3.8.1 FOR   testing XQ 3.8.2 WHERE  testing XQ 3.8.3   Return :)

(: testing XQ 3.11 Every   testing XQ 3.11 Some :)


<frequent_bidder>
  {
    for $u in doc("users.xml")//user_tuple
    where 
      every $item in doc("items.xml")//item_tuple satisfies 
        some $b in doc("bids.xml")//bid_tuple satisfies 
          ($item/itemno = $b/itemno and $u/userid = $b/userid)
    return
        $u/name
  }
</frequent_bidder>
















