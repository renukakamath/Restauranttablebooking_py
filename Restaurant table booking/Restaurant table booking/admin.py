from flask import*
from database import *
import uuid

admin=Blueprint('admin',__name__)

@admin.route("/adminhome")
def adminhome():
	return render_template("adminhome.html")

@admin.route("/managestaff",methods=['post','get'])
def managestaff():
	data={}
	q="select * from staff"
	res=select(q)
	data['view']=res
	if "submit" in request.form:
		u=request.form['uname']
		f=request.form['fname']
		l=request.form['lname']
		p=request.form['phn']
		
		e=request.form['email']
		c=request.form['city']
		
		ps=request.form['pass']
		q="insert into login values('%s','%s','staff','1')"%(u,ps)
		insert(q)
		s="insert into staff values(null,'%s','%s','%s','%s','%s','%s','1')"%(u,f,l,p,e,c)
		insert(s)
		return redirect(url_for("admin.managestaff"))
	if "action" in request.args:
		action=request.args['action']
		cid=request.args['cid']
		print(action,cid)
	else:
		action=None
	if action=="active":
		q="update login set User_status='1' where Username='%s'"%(cid)
		update(q)
		print(q)
		q="update staff set Staff_status='1' where Username='%s'"%(cid)
		update(q)
	if action=="inactive":
		q="update login set User_status='0' where Username='%s'"%(cid)
		update(q)
		q="update staff set Staff_status='0' where Username='%s'"%(cid)
		update(q)
	if action=="update":
		q="select * from staff where Username='%s'"%(cid)
		res=select(q)
		data['up']=res
	if "update" in request.form:
		f=request.form['fname']
		l=request.form['lname']
		p=request.form['phn']
		
		e=request.form['email']
		c=request.form['city']
		
		q="update staff set Staff_fname='%s',Staff_lname='%s',Staff_mobile='%s',Staff_email='%s',Staff_city='%s' where Username='%s'"%(f,l,p,e,c,cid)
		update(q)
		return redirect(url_for("admin.managestaff"))
	return render_template("admin_manage_staff.html",data=data)

@admin.route("/manage_timeslot",methods=['post','get'])
def manage_timeslot():
	data={}
	q="select * from timeslot"
	res=select(q)
	data['view']=res
	if "submit" in request.form:
		date=request.form['date']
		time=request.form['time']
		q="insert into timeslot values(null,'%s','%s')"%(date,time)
		insert(q)
	if "action" in request.args:
		action=request.args['action']
		cid=request.args['cid']
	else:
		action=None

	if action=="update":
		q="select * from timeslot where Timeslot_id='%s'"%(cid)
		res=select(q)
		data['time']=res 

	if "update" in request.form:
		date=request.form['date']
		time=request.form['time']
		q="update timeslot set Date='%s',Time='%s' where Timeslot_id='%s'"%(date,time,cid)
		update(q)
		return redirect(url_for("admin.manage_timeslot"))
	return render_template("admin_manage_timeslot.html",data=data)


@admin.route("/manage_tables",methods=['post','get'])
def manage_tables():
	data={}
	q="select * from tables"
	res=select(q)
	data['view']=res
	if "submit" in request.form:
		tnum=request.form['tnum']
		tcat=request.form['tcat']
		q="INSERT INTO tables VALUES(NULL,'%s','%s','pending')"%(tnum,tcat)
		insert(q)
		return redirect(url_for("admin.manage_tables"))
	if "action" in request.args:
		action=request.args['action']
		cid=request.args['cid']
	else:
		action=None

	

	if action=="update":
		q="select * from tables where Table_id='%s'"%(cid)
		res=select(q)
		data['time']=res 

	if "update" in request.form:
		tnum=request.form['tnum']
		tcat=request.form['tcat']
		q="update tables set Table_num='%s',Table_category='%s' where Table_id='%s'"%(tnum,tcat,cid)
		update(q)
		return redirect(url_for("admin.manage_tables"))
	return render_template("admin_manage_tables.html",data=data)

@admin.route("/manage_category",methods=['post','get'])
def manage_category():
	data={}
	q="select * from category"
	res=select(q)
	data['view']=res
	if "submit" in request.form:
		cat=request.form['cat']
		
		q="INSERT INTO category VALUES(NULL,'%s')"%(cat)
		insert(q)
		return redirect(url_for("admin.manage_category"))
	if "action" in request.args:
		action=request.args['action']
		cid=request.args['cid']
	else:
		action=None

	if action=="update":
		q="select * from category where Category_id='%s'"%(cid)
		res=select(q)
		data['time']=res 

	if "update" in request.form:
		cat=request.form['cat']
		
		q="update category set Category='%s' where Category_id='%s'"%(cat,cid)
		update(q)
		return redirect(url_for("admin.manage_category"))
	return render_template("admin_manage_category.html",data=data)



@admin.route("/view_customer",methods=['post','get'])
def view_customer():
	data={}
	q="select * from customer"
	res=select(q)
	data['view']=res
	return render_template("admin_view_customer.html",data=data)


@admin.route("/manage_menu",methods=['post','get'])
def manage_menu():
	data={}
	q="select * from category"
	res=select(q)
	data['category']=res
	q="select * from menu inner join category using(Category_id)"
	res=select(q)
	data['view']=res
	if "submit" in request.form:
		cat=request.form['cat']
		menu=request.form['menu']
		rate=request.form['rate']
		img=request.files['img']
		path='static/images/'+str(uuid.uuid4())+img.filename
		img.save(path)
		q="insert into menu values(null,'%s','%s','%s','%s','1')"%(cat,menu,rate,path)
		insert(q)
		return redirect(url_for("admin.manage_menu"))

	if "action" in request.args:
		action=request.args['action']
		cid=request.args['cid']
	else:
		action=None
	if action=="active":
		q="update menu set Status='1' where Menu_id='%s'"%(cid)
		update(q)
		return redirect(url_for("admin.manage_menu"))
	if action=="inactive":
		q="update menu set Status='0' where Menu_id='%s'"%(cid)
		update(q)
		return redirect(url_for("admin.manage_menu"))
	if action=="update":
		q="select * from menu where Menu_id='%s'"%(cid)
		res=select(q)
		data['up']=res 

	if "update" in request.form:
		menu=request.form['menu']
		rate=request.form['rate']
		
		q="update menu set Menu='%s',Rate='%s' where Menu_id='%s'"%(menu,rate,cid)
		update(q)
		return redirect(url_for("admin.manage_menu"))
	return render_template("admin_manage_menu.html",data=data)

@admin.route("/view_booking",methods=['post','get'])
def view_booking():
	data={}
	q="SELECT * FROM booking INNER JOIN customer USING(Customer_id) INNER JOIN timeslot USING(Timeslot_id) INNER JOIN `tables` USING(Table_id)"
	res=select(q)
	data['view']=res
	return render_template("admin_view_booking.html",data=data)

@admin.route("/view_payment",methods=['post','get'])
def view_payment():
	data={}
	q="select * from payment inner join card using(card_id)"
	res=select(q)
	data['view']=res
	return render_template("admin_view_booking.html",data=data)

@admin.route("/manage_extraservice",methods=['post','get'])
def manage_extraservice():
	data={}
	q="select * from extraservice"
	res=select(q)
	data['view']=res
	if "submit" in request.form:
		extra=request.form['extra']
		des=request.form['des']
		price=request.form['price']

		
		q="INSERT INTO extraservice VALUES(NULL,'%s','%s','%s')"%(extra,des,price)
		insert(q)
		return redirect(url_for("admin.manage_extraservice"))
	if "action" in request.args:
		action=request.args['action']
		cid=request.args['cid']
	else:
		action=None

	if action=="update":
		q="select * from extraservice where Extraservice_id='%s'"%(cid)
		res=select(q)
		data['time']=res 

	if "update" in request.form:
		extra=request.form['extra']
		des=request.form['des']
		price=request.form['price']
		q="update extraservice set Extraservice_name='%s',Description='%s',Price='%s' where Extraservice_id='%s'"%(extra,des,price,cid)
		update(q)
		return redirect(url_for("admin.manage_extraservice"))
	return render_template("admin_manage_extraservice.html",data=data)

@admin.route("/view_complaints",methods=['post','get'])
def view_complaints():
	data={}
	q="select * from complaint"
	res=select(q)
	data['view']=res
	return render_template("admin_view_complaint.html",data=data)

@admin.route("/send_reply",methods=['post','get'])
def send_reply():
	cid=request.args['cid']
	if "submit" in request.form:
		reply=request.form['reply']
		q="update complaint set Reply='%s' where Complaint_id='%s'"%(reply,cid)
		update(q)
	return render_template("admin_send_reply.html")

@admin.route("/book_service",methods=['post','get'])
def book_service():
    if "action" in request.args:
        action=request.args['action']
        
    else:
        action=None
        
    return render_template("admin")







