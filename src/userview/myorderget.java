package userview;

import java.sql.Date;

public class myorderget {
		private String name;
		private String model;
		private String days;
		private String rent;
		private Date order_date;
		private Date delivery_date;
		private Date return_date;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getModel() {
			return model;
		}
		public void setModel(String model) {
			this.model = model;
		}
		public String getDays() {
			return days;
		}
		public void setDays(String days) {
			this.days = days;
		}
		public String getRent() {
			return rent;
		}
		public void setRent(String rent) {
			this.rent = rent;
		}
		public Date getOrder_date() {
			return order_date;
		}
		public void setOrder_date(Date order_date) {
			this.order_date = order_date;
		}
		public Date getDelivery_date() {
			return delivery_date;
		}
		public void setDelivery_date(Date delivery_date) {
			this.delivery_date = delivery_date;
		}
		public Date getReturn_date() {
			return return_date;
		}
		public void setReturn_date(Date return_date) {
			this.return_date = return_date;
		}
		@Override
		public String toString() {
			return "myorderget [name=" + name + ", model=" + model + ", days=" + days + ", rent=" + rent
					+ ", order_date=" + order_date + ", delivery_date=" + delivery_date + ", return_date=" + return_date
					+ "]";
		}
		
}
