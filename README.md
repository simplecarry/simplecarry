# *Simple Carry*

**Simple Carry** is a Ruby on Rails application that connect people to get to know each other and buy/sell stuffs oversea without shiping price. 

URL: ** **

## User Stories

The following **required** functionality is complete:

### User story 1
As a user i can View/Signup/Signin to the app. So that i can start using the app 
* First glance of the web should be homepage with name/slogan/pictures
* User can see Search tab, Buyers tab, Helpers tab, Messages tab
* User can search by where, what need to be brought
* User can not use Buyers tab and Helpers tab until they signup/login
* User can Signup, Signin and redirected to Search page
* User can see many item listed here with status
* User can click on item to see details (Buyers, Name, picture, link, description)

### User story 2
As a user i can post my item in Buyers tab, sothat i can get buy my stuffs easier and cheaper.
* User can post new item in Buyers tab buy filling item form (Item name, links, picture, descriptions), location form (where to buy this item, how to collect item), price form (Price willing to pay, service fee (2$ + 5% of item's price), total price).
* Collection method should be 2 options (pickup and courier), tooltips for Price willing to pay: "This price is included retail price and tips for Helpers", tooltips for service fee: "2$ + 5% of item's price".
* User can go back to previous action before clicking submit button.
* User submit post and it should be appeared in search page.
* 

### User story 3
As a user i can post my travel plan in Helpers tab, sothat i can help people buy stuffs and get more income
* User can post new travel plan by goto Helpers tab and fill forms with details: Country you can buy stuff, and Return date to VietNam
* After submiting user can be redirected to search page with filter as same country when they post there trip
* 
### User story 4
As a user i can see status of my item, sothat i can keep track of them
* https://docs.google.com/spreadsheets/d/1RXqzNGyF0MiYs995yNG0tkUpFRB_tgcPHtnNA9GzmwI/edit?usp=sharing

### User story 5
As a user i can see messages whenever the item change status, sothat i can be notified and have actions
* User get notification in Messages tab whenever the item change status, click on message user is redirected to the item detail page
* If status is change to Pending: Buyers have options "Process deposit" and "Reject", Helpers have one option is "Cancel"
** If select "Process deposit" user have to fill in a payment form: payment method is credit card (card number, name, expired date, CVC).
* If status is change to Confirmed: Helper have options "Comfirmed" or "Cancel"



## Notes


## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
