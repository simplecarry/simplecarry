# *Simple Carry*

**Simple Carry** is a Ruby on Rails application that connect people to get to know each other and buy/sell stuffs oversea without shiping price. 

URL: ** **

## User Stories

The following **required** functionality is complete:
===Truc trac===
* [x] As a user, I can see the following static pages: home page with name/slogan/pictures AND search box, about us
* [x] As a user I can register/login/logout
* [x] As a user I am redirected to home page after login/register

===Hieu khung===
* [x] As an authenticated user, I can create a request
    * [x] Item info: name, links, picture, description
    * [x] Price: user input their price that they willing to pay.
    * [x] Location: where to buy this item, how to deliver item
    * [x] Status: Open (https://docs.google.com/spreadsheets/d/1RXqzNGyF0MiYs995yNG0tkUpFRB_tgcPHtnNA9GzmwI/edit?usp=sharing)
* [x] As an authenticated user, I can delete my own request
* [x] As an authenticated user, I can see a list of my requests
* [x] As an authenticated user, I can filter my requests by status/location

===Hieu Khung map===
* [x] As a user, I can search for requests by location/name/description/status
* [x] As a user, I can click on item to see details (requester, name, picture, link, description, status, quantity, offer price)
* [x] As an authenticated user, I can create my travel plan
   * [x] Location: where I will be
   * [x] Time: when I will be back to VietNam

===Kha di˜===
* [x] As an authenticated user, I can make an offer on an open request (carry price, delivery date)
* [x] As an authenticated user, I cancel my offer on a request
* [x] As an authenticated user, I cannot make an offer on my own requests
* [x] As an authenticated user, I select 1 offer for my requests status -> pending deposit
* [x] As an authenticated user, I reject an offer on my request -> Open

===Huy===
* [x] As an authenticated user, I can send/receive message with my selected helper
* [x] As an authenticated user, I can receive system message when there is a new request in my travel plan
* [x] As an authenticated user, I can receive system message when my request changes status

===Huy===
* [x] As an authenticated user, I can deposit money for my accepted request
* [x] As an authenticated user, I can receive money for my completed offer

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
