{block name='productdetails-details-info-description-wrapper' append}
    <style>
    .gclassolli {
        background-color: white;
        border: 1px solid black; 
        padding: 3px 20px 3px 20px; 
        font-family: 'Open Sans', sans-serif;
    }
    
    .gclassolli:hover {
        background-color: #FFA54F;  
    }
    
    .modalpopup {
      display: none; 
      position: fixed; 
      z-index: 600 !important; 
      padding-top: 150px; 
      left: 0;
      top: 0;
      width: 100%; 
      height: 100%; 
      overflow: auto; 
      background-color: rgb(0,0,0); 
      background-color: rgba(0,0,0,0.4);
    }
    
    .modal-content {
      background-color: #fefefe;
      margin: auto;
      padding: 15px;
      border: 2px solid #FFA54F;
      width: 70%;
    }
    
    .close-btn {
      color: #aaaaaa;
      font-size: 28px;
      font-weight: bold;
      margin-right: 15px;
    }
    
    .close-btn:hover,
    .close-btn:focus {
      color: #000;
      text-decoration: none;
      cursor: pointer;
    }
    
    .popup-content {
      display: block;
      margin:0 auto;
      justify-content: center;
    }
    
    .modal-header {
      margin:0 auto;
      text-decoration: underline;
      justify-content: center;
      border-bottom: 0px solid white;
      padding-bottom: 25px;
    }
    
    .close-the-modal {
      display: flex;
      justify-content: flex-end;
    }

    .size-table-style td{
      padding: 5px;
      text-align: center;
    }

    .size-table-style-binding td{
      padding: 15px;
      text-align: center;
      padding-left: 40px;
      padding-right: 40px;
    }

    .size-table-style-binding tr:nth-child(even){
      background-color: #f2f2f2;
    }

    .size-table-first-row{
      background-color: #ffa44fb5;
    }
    .size-table-first-row th{
      padding: 4px;
      text-align: center;
    }

    .size-table-first-row-binding{
      background-color: #ffa44fb5;
    }
    .size-table-first-row-binding th{
      padding: 15px;
      text-align: center;
    }

    .testcontainer {
      display: flex;
      justify-content: center;
      margin-bottom: 15px;
    }
    </style>

{assign var="isMatchFound" value=false}

{assign var="isMatchFoundBindings" value=false}

{assign var="burton" value='<table class="size-table-style">
<thead><tr class="size-table-first-row"><th>Fußlänge cm</th><th>21,0 </th><th>21,5 </th><th>22,0 </th><th>22,5 </th><th>23,0 </th><th>23,5 </th><th>24,0 </th><th>24,5 </th><th>25,0 </th><th>25,5 </th><th>26,0 </th><th>26,5 </th><th>27,0 </th><th>27,5 </th><th>28,0 </th><th>28,5 </th><th>29,0 </th><th>29,5 </th><th>30,0 </th><th>30,5 </th><th>31,0 </th><th>31,5 </th><th>32,0 </th><th>32,5 </th><th>33,0 </th></tr></thead><tbody>
 <tr><td>Mondo</td><td>21,0 </td><td>21,5 </td><td>22,0 </td><td>22,5 </td><td>23,0 </td><td>23,5 </td><td>24,0 </td><td>24,5 </td><td>25,0 </td><td>25,5 </td><td>26,0 </td><td>26,5 </td><td>27,0 </td><td>27,5 </td><td>28,0 </td><td>28,5 </td><td>29,0 </td><td>29,5 </td><td>30,0 </td><td>*</td><td>31,0 </td><td>*</td><td>32,0 </td><td>*</td><td>33,0 </td></tr>
 <tr><td>Euro</td><td>34,0 </td><td>*</td><td>35,0 </td><td>36,0 </td><td>36,5 </td><td>37,0 </td><td>38,0 </td><td>39,0 </td><td>40,0 </td><td>40.5</td><td>41,0 </td><td>41.5</td><td>42,0 </td><td>42.5</td><td>43,0 </td><td>43.5</td><td>44,0 </td><td>44.5</td><td>45,0 </td><td>*</td><td>46,0 </td><td>*</td><td>47,0 </td><td>*</td><td>48,0 </td></tr>
 <tr><td>US Men    </td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>6,0 </td><td>6,5 </td><td>7,0 </td><td>7,5 </td><td>8,0 </td><td>8,5 </td><td>9,0 </td><td>9,5 </td><td>10,0 </td><td>10,5 </td><td>11,0 </td><td>11,5 </td><td>12,0 </td><td>*</td><td>13,0 </td><td>*</td><td>14,0 </td><td>*</td><td>15,0 </td></tr>
 <tr><td>US Women</td><td>4,0 </td><td>*</td><td>5,0 </td><td>5,5 </td><td>6,0 </td><td>6,5 </td><td>7,0 </td><td>7,5 </td><td>8,0 </td><td>8,5 </td><td>9,0 </td><td>9,5 </td><td>10,0 </td><td>10,5 </td><td>11,0 </td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
</tbody></table>'}

{assign var='k2' value='<table class="size-table-style">
<thead><tr class="size-table-first-row"><th>Fußlänge cm</th><th>21,0</th><th>21,5</th><th>22,0</th><th>22,5</th><th>23,0</th><th>23,5</th><th>24,0</th><th>24,5</th><th>25,0</th><th>25,5</th><th>26,0</th><th>26,5</th><th>27,0</th><th>27,5</th><th>28,0</th><th>28,5</th><th>29,0</th><th>29,5</th><th>30,0</th><th>30,5</th><th>31,0</th><th>31,5</th><th>32,0</th><th>32,5</th><th>33,0</th><th>34,0</th><th>35,0</th></tr></thead><tbody>
 <tr><td>Mondo</td><td>21,0</td><td>21,5</td><td>22,0</td><td>22,5</td><td>23,0</td><td>23,5</td><td>24,0</td><td>24,5</td><td>25,0</td><td>25,5</td><td>26,0</td><td>26,5</td><td>27,0</td><td>27,5</td><td>28,0</td><td>28,5</td><td>29,0</td><td>29,5</td><td>30,0</td><td>30,5</td><td>31,0</td><td>*</td><td>32,0</td><td>*</td><td>33,0</td><td>34,0</td><td>*</td></tr>
 <tr><td>Euro</td>
<td>*</td><td>*</td><td>35,5</td><td>*</td><td>36,5</td><td>37,0</td><td>38,0</td><td>39,0</td><td>39,5</td><td>40,0</td><td>40,5</td><td>41,5</td><td>42,0</td><td>42,5</td><td>43,5</td><td>44,0</td><td>44,5</td><td>45,0</td><td>46,0</td><td>47,0</td><td>48,0</td><td>*</td><td>49,0</td><td>*</td><td>50,0</td><td>51,0</td><td>*</td></tr>
 <tr><td>US Men</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>11,5</td><td>12,0</td><td>12,5</td><td>13,0</td><td>*</td><td>14,0</td><td>*</td><td>15,0</td><td>16,0</td><td>*</td></tr>
 <tr><td>US Women</td><td>*</td><td>*</td><td>5,0</td><td>*</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
</tbody></table>'}

{assign var='nidecker' value='<table class="size-table-style">
<thead><tr class="size-table-first-row"><th>Fußlänge cm</th><th>21,0 </th><th>21,5 </th><th>22,0 </th><th>22,5 </th><th>23,0 </th><th>23,5 </th><th>24,0 </th><th>24,5 </th><th>25,0 </th><th>25,5 </th><th>26,0 </th><th>26,5 </th><th>27,0 </th><th>27,5 </th><th>28,0 </th><th>28,5 </th><th>29,0 </th><th>29,5 </th><th>30,0 </th><th>30,5 </th><th>31,0 </th><th>31,5 </th><th>32,0 </th><th>32,5 </th><th>33,0 </th></tr></thead><tbody>
 <tr><td>Mondo</td><td>21,0</td><td>21,5</td><td>22,0</td><td>22,5</td><td>23,0</td><td>23,5</td><td>24,0</td><td>24,5</td><td>25,0</td><td>25,5</td><td>26,0</td><td>26,5</td><td>27,0</td><td>27,5</td><td>28,0</td><td>28,5</td><td>29,0</td><td>29,5</td><td>30,0</td><td>*</td><td>31,0</td><td>31,5</td><td>32,0</td><td>32,5</td><td>33,0</td></tr>
 <tr><td>Euro</td><td>*</td><td>*</td><td>35,5</td><td>36,0</td><td>37,0</td><td>37,5</td><td>38,0</td><td>39,0</td><td>39,5</td><td>40,0</td><td>41,0</td><td>41,5</td><td>42,0</td><td>42,5</td><td>43,0</td><td>44,0</td><td>44,5</td><td>45,0</td><td>45,5</td><td>*</td><td>47,0</td><td>48,5</td><td>*</td><td>49,5</td><td>*</td></tr>
 <tr><td>US Men    </td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>11,5</td><td>12,0</td><td>*</td><td>13,0</td><td>14,0</td><td>*</td><td>15,0</td><td>*</td></tr>
 <tr><td>US Women</td><td>*</td><td>*</td><td>5,5</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
</tbody></table>'}

{assign var='flow' value='<table class="size-table-style">
<thead><tr class="size-table-first-row"><th>Fußlänge cm</th><th>21,0</th><th>21,5</th><th>22,0</th><th>22,5</th><th>23,0</th><th>23,5</th><th>24,0</th><th>24,5</th><th>25,0</th><th>25,5</th><th>26,0</th><th>26,5</th><th>27,0</th><th>27,5</th><th>28,0</th><th>28,5</th><th>29,0</th><th>29,5</th><th>30,0</th><th>30,5</th><th>31,0</th><th>31,5</th><th>32,0</th><th>32,5</th><th>33,0</th></tr></thead><tbody>
 <tr><td>Mondo</td><td>21,0</td><td>21,5</td><td>22,0</td><td>22,5</td><td>23,0</td><td>23,5</td><td>24,0</td><td>24,5</td><td>25,0</td><td>25,5</td><td>26,0</td><td>26,5</td><td>27,0</td><td>27,5</td><td>28,0</td><td>28,5</td><td>29,0</td><td>29,5</td><td>30,0</td><td>*</td><td>31,0</td><td>31,5</td><td>32,0</td><td>32,5</td><td>33,0</td></tr>
 <tr><td>Euro</td><td>*</td><td>*</td><td>35,5</td><td>36,0</td><td>37,0</td><td>37,5</td><td>38,0</td><td>39,0</td><td>39,5</td><td>40,0</td><td>41,0</td><td>41,5</td><td>42,0</td><td>42,5</td><td>43,0</td><td>44,0</td><td>44,5</td><td>45,0</td><td>45,5</td><td>*</td><td>47,0</td><td>48,5</td><td>*</td><td>49,5</td><td>*</td></tr>

 <tr><td>US Men    </td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>11,5</td><td>12,0</td><td>*</td><td>13,0</td><td>14,0</td><td>*</td><td>15,0</td><td>*</td></tr>
 <tr><td>US Women</td><td>*</td><td>*</td><td>5,5</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
</tbody></table>'}

{assign var='thirtytwo' value='<table class="size-table-style">
<thead><tr class="size-table-first-row"><th>Fußlänge cm</th><th>21,0</th><th>21,5</th><th>22,0</th><th>22,5</th><th>23,0</th><th>23,5</th><th>24,0</th><th>24,5</th><th>25,0</th><th>25,5</th><th>26,0</th><th>26,5</th><th>27,0</th><th>27,5</th><th>28,0</th><th>28,5</th><th>29,0</th><th>29,5</th><th>30,0</th><th>30,5</th><th>31,0</th><th>31,5</th><th>32,0</th><th>32,5</th><th>33,0</th><th>33,5</th><th>34,0</th><th>34,5</th><th>35,0</th><th>35,5</th><th>36,0</th></tr></thead><tbody>
 <tr><td>Mondo</td><td>21,0</td><td>21,5</td><td>22,0</td><td>22,5</td><td>23,0</td><td>23,5</td><td>24,0</td><td>24,5</td><td>25,0</td><td>25,5</td><td>26,0</td><td>26,5</td><td>27,0</td><td>27,5</td><td>28,0</td><td>28,5</td><td>29,0</td><td>29,5</td><td>30,0</td><td>*</td><td>31,0</td><td>*</td><td>32,0</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
 <tr><td>Euro</td><td>*</td><td>*</td><td>35,0</td><td>36,0</td><td>36,5</td><td>37,0</td><td>38,0</td><td>38,5</td><td>39,0</td><td>40,0</td><td>40,5</td><td>41,0</td><td>42,0</td><td>42,5</td><td>43,0</td><td>44,0</td><td>44,5</td><td>45,0</td><td>45,5</td><td>*</td><td>47,0</td><td>*</td><td>48,0</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
 
 <tr><td>US Men</td><td>*</td><td>*</td><td>*</td><td>*</td><td>5,0</td><td>5,5</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>11,5</td><td>12,0</td><td>*</td><td>13,0</td><td>*</td><td>14,0</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
 <tr><td>US Women</td><td>*</td><td>*</td><td>5,0</td><td>5,5</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
</tbody></table>'}

{assign var='dc' value='<table class="size-table-style">
<thead><tr class="size-table-first-row"><th>Fußlänge cm</th><th>21,0</th><th>21,5</th><th>22,0</th><th>22,5</th><th>23,0</th><th>23,5</th><th>24,0</th><th>24,5</th><th>25,0</th><th>25,5</th><th>26,0</th><th>26,5</th><th>27,0</th><th>27,5</th><th>28,0</th><th>28,5</th><th>29,0</th><th>29,5</th><th>30,0</th><th>30,5</th><th>31,0</th><th>31,5</th><th>32,0</th><th>32,5</th><th>33,0</th><th>33,5</th><th>34,0</th><th>34,5</th><th>35,0</th><th>35,5</th><th>36,0</th></tr></thead><tbody>
 <tr><td>Mondo</td><td>*</td><td>*</td><td>22,0</td><td>22,5</td><td>23,0</td><td>23,5</td><td>24,0</td><td>24,5</td><td>25,0</td><td>25,5</td><td>26,0</td><td>26,5</td><td>27,0</td><td>27,5</td><td>28,0</td><td>28,5</td><td>29,0</td><td>29,5</td><td>30,0</td><td>30,5</td><td>31,0</td><td>*</td><td>32,0</td><td>*</td><td>33,0</td><td>*</td><td>34,0</td><td>*</td><td>35,0</td><td>*</td><td>36,0</td></tr>
 <tr><td>Euro</td><td>*</td><td>*</td><td>36,0</td><td>36,5</td><td>37,0</td><td>37,5</td><td>38,0</td><td>38,5</td><td>39,0</td><td>40,0</td><td>40,5</td><td>41,0</td><td>42,0</td><td>42,5</td><td>43,0</td><td>44,0</td><td>44,5</td><td>45,0</td><td>46,0</td><td>46,5</td><td>47,0</td><td>*</td><td>48,5</td><td>*</td><td>50,0</td><td>*</td><td>52,0</td><td>*</td><td>53,5</td><td>*</td><td>55,0</td></tr>

 <tr><td>US Men</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>11,5</td><td>12,0</td><td>12,5</td><td>13,0</td><td>*</td><td>14,0</td><td>*</td><td>15,0</td><td>*</td><td>16,0</td><td>*</td><td>17,0</td><td>*</td><td>18,0</td></tr>
 <tr><td>US Women</td><td>*</td><td>*</td><td>5,0</td><td>5,5</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
</tbody></table>'}

{assign var='ride' value='<table class="size-table-style">
<thead><tr class="size-table-first-row"><th>Fußlänge cm</th><th>21,0</th><th>21,5</th><th>22,0</th><th>22,5</th><th>23,0</th><th>23,5</th><th>24,0</th><th>24,5</th><th>25,0</th><th>25,5</th><th>26,0</th><th>26,5</th><th>27,0</th><th>27,5</th><th>28,0</th><th>28,5</th><th>29,0</th><th>29,5</th><th>30,0</th><th>30,5</th><th>31,0</th><th>31,5</th><th>32,0</th><th>32,5</th><th>33,0</th><th>34,0</th></tr></thead><tbody>
 <tr><td>Mondo</td><td>21,0</td><td>21,5</td><td>22,0</td><td>22,5</td><td>23,0</td><td>23,5</td><td>24,0</td><td>24,5</td><td>25,0</td><td>25,5</td><td>26,0</td><td>26,5</td><td>27,0</td><td>27,5</td><td>28,0</td><td>28,5</td><td>29,0</td><td>29,5</td><td>30,0</td><td>30,5</td><td>31,0</td><td>*</td><td>32,0</td><td>*</td><td>33,0</td><td>34,0</td></tr>
 <tr><td>Euro</td>
<td>*</td><td>*</td><td>35,5</td><td>*</td><td>36,5</td><td>37,0</td><td>38,0</td><td>39,0</td><td>39,5</td><td>40,0</td><td>40,5</td><td>41,5</td><td>42,0</td><td>42,5</td><td>43,5</td><td>44,0</td><td>44,5</td><td>45,0</td><td>46,0</td><td>47,0</td><td>48,0</td><td>*</td><td>49,0</td><td>*</td><td>50,0</td><td>51,0</td></tr>
 <tr><td>US Men</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>11,5</td><td>12,0</td><td>12,5</td><td>13,0</td><td>*</td><td>14,0</td><td>*</td><td>15,0</td><td>16,0</td></tr>
 <tr><td>US Women</td><td>*</td><td>*</td><td>5,0</td><td>*</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
</tbody></table>'}

{assign var='deeluxe' value='<table class="size-table-style">
<thead><tr class="size-table-first-row"><th>Fußlänge cm</th><th>21,0</th><th>21,5</th><th>22,0</th><th>22,5</th><th>23,0</th><th>23,5</th><th>24,0</th><th>24,5</th><th>25,0</th><th>25,5</th><th>26,0</th><th>26,5</th><th>27,0</th><th>27,5</th><th>28,0</th><th>28,5</th><th>29,0</th><th>29,5</th><th>30,0</th><th>30,5</th><th>31,0</th><th>31,5</th><th>32,0</th><th>32,5</th><th>33,0</th></tr></thead><tbody>
 <tr><td>Mondo</td><td>21,0</td><td>21,5</td><td>22,0</td><td>22,5</td><td>23,0</td><td>23,5</td><td>24,0</td><td>24,5</td><td>25,0</td><td>25,5</td><td>26,0</td><td>26,5</td><td>27,0</td><td>27,5</td><td>28,0</td><td>28,5</td><td>29,0</td><td>29,5</td><td>30,0</td><td>30,5</td><td>31,0</td><td>31,5</td><td>32,0</td><td>32,5</td><td>33,0</td></tr>
 <tr><td>Euro</td><td>34,5</td><td>35,0</td><td>35,5</td><td>36,0</td><td>37,0</td><td>37,5</td><td>38,0</td><td>38,5</td><td>39,0</td><td>40,0</td><td>40,5</td><td>41,0</td><td>42,0</td><td>42,5</td><td>43,0</td><td>43,5</td><td>44,0</td><td>45,0</td><td>45,5</td><td>46,0</td><td>47,0</td><td>47,5</td><td>48,0</td><td>*</td><td>*</td></tr>
 <tr><td>US Men</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>11,5</td><td>12,0</td><td>12,5</td><td>13,0</td><td>13,5</td><td>14,0</td><td>*</td><td>*</td></tr>
 <tr><td>US Women</td><td>3,5</td><td>4,0</td><td>4,5</td><td>5,0</td><td>5,5</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
</tbody></table>'}

{assign var='rome' value='<table class="size-table-style">
<thead><tr class="size-table-first-row"><th>Fußlänge cm</th><th>23,0</th><th>23,5</th><th>24,0</th><th>24,5</th><th>25,0</th><th>25,5</th><th>26,0</th><th>26,5</th><th>27,0</th><th>27,5</th><th>28,0</th><th>28,5</th><th>29,0</th><th>29,5</th><th>30,0</th><th>30,5</th></tr></thead><tbody>
 <tr><td>Euro</td><td>36,5</td><td>37,0</td><td>38,0</td><td>38,5</td><td>39,0</td><td>40,0</td><td>40,5</td><td>41,0</td><td>42,0</td><td>42,5</td><td>43,0</td><td>44,0</td><td>44,5</td><td>45,0</td><td>45,5</td><td>46,0</td></tr>
 <tr><td>US Men</td><td>5,0</td><td>5,5</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>11,5</td><td>12,0</td><td>12,5</td></tr>
 <tr><td>US Women</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>11,5</td><td>12,0</td><td>12,5</td><td>13,0</td><td>13,5</td><td>14,0</td></tr>
</tbody></table>'}

{assign var='nitro' value='<table class="size-table-style">
<thead><tr class="size-table-first-row"><th>Fußlänge cm</th><th>19</th><th>19,5</th><th>20</th><th>20,5</th><th>21</th><th>21,5</th><th>22</th><th>22,5</th><th>23</th><th>23,5</th><th>24</th><th>24,5</th><th>25</th><th>25,5</th><th>26</th><th>26,5</th><th>27</th><th>27,5</th><th>28</th><th>28,5</th><th>29</th><th>29,5</th><th>30</th><th>30,5</th><th>31</th><th>31,5</th><th>32</th><th>32,5</th><th>33</th></tr></thead><tbody>
 <tr><td>Mondo</td><td>19</td><td>19,5</td><td>20</td><td>20,5</td><td>21</td><td>21,5</td><td>22</td><td>22,5</td><td>23</td><td>23,5</td><td>24</td><td>24,5</td><td>25</td><td>25,5</td><td>26</td><td>26,5</td><td>27</td><td>27,5</td><td>28</td><td>28,5</td><td>29</td><td>29,5</td><td>30</td><td>30,5</td><td>31</td><td>31,5</td><td>32</td><td>32,5</td><td>33</td></tr>
 <tr><td>Euro</td><td>30</td><td>31</td><td>32</td><td>*</td><td>33</td><td>34</td><td>*</td><td>35</td><td>36</td><td>*</td><td>37</td><td>38</td><td>*</td><td>39</td><td>40</td><td>*</td><td>41</td><td>42</td><td>*</td><td>43</td><td>44</td><td>*</td><td>45</td><td>46</td><td>*</td><td>47</td><td>48</td><td>*</td><td>49</td></tr>
 <tr><td>US Men</td><td>1</td><td>1,5</td><td>2</td><td>2,5</td><td>3</td><td>3,5</td><td>4</td><td>4,5</td><td>5</td><td>5,5</td><td>6</td><td>6,5</td><td>7</td><td>7,5</td><td>8</td><td>8,5</td><td>9</td><td>9,5</td><td>10</td><td>10,5</td><td>11</td><td>11,5</td><td>12</td><td>12,5</td><td>13</td><td>13,5</td><td>14</td><td>14,5</td><td>15</td></tr>
 <tr><td>US Women</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>4,5</td><td>5</td><td>5,5</td><td>6</td><td>6,5</td><td>7</td><td>7,5</td><td>8</td><td>8,5</td><td>9</td><td>9,5</td><td>10</td><td>10,5</td><td>11</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
</tbody></table>'}

{assign var='salomon' value='<table class="size-table-style">
<thead><tr class="size-table-first-row"><th>Fußlänge cm</th><th>22,0</th><th>22,5</th><th>23,0</th><th>23,5</th><th>24,0</th><th>24,5</th><th>25,0</th><th>25,5</th><th>26,0</th><th>26,5</th><th>27,0</th><th>27,5</th><th>28,0</th><th>28,5</th><th>29,0</th><th>29,5</th><th>30,0</th><th>30,5</th><th>31,0</th><th>31,5</th></tr></thead><tbody>
 <tr><td>Mondo</td><td>22,0</td><td>22,5</td><td>23,0</td><td>23,5</td><td>24,0</td><td>24,5</td><td>25,0</td><td>25,5</td><td>26,0</td><td>26,5</td><td>27,0</td><td>27,5</td><td>28,0</td><td>28,5</td><td>29,0</td><td>29,5</td><td>30,0</td><td>30,5</td><td>31,0</td><td>31,5</td></tr>
 <tr><td>EU Größe</td><td>34.5</td><td>35.5</td><td>36.5</td><td>37,0</td><td>38,0</td><td>38.5</td><td>39,0</td><td>40,0</td><td>40.5</td><td>41.5</td><td>42,0</td><td>42.5</td><td>43,0</td><td>43.5</td><td>44,0</td><td>44.5</td><td>45.5</td><td>46,0</td><td>46.5</td><td>47,0</td></tr>
 <tr><td>US Men</td><td>3,5</td><td>4,0</td><td>5,0</td><td>5,5</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>11,5</td><td>12,0</td><td>12,5</td><td>13,0</td><td>13,5</td></tr>
 <tr><td>US Women</td><td>4,0</td><td>5,0</td><td>6,0</td><td>6,5</td><td>7,0</td><td>7,5</td><td>8,0</td><td>8,5</td><td>9,0</td><td>9,5</td><td>10,0</td><td>10,5</td><td>11,0</td><td>11,5</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td><td>*</td></tr>
</tbody></table>'}


{* Variablen für Bindungstabellen *}

{assign var='unionwomen' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th></tr></thead><tbody>
 <tr><td>EU</td><td>34-37</td><td>38-40,5</td><td>41-43</td></tr>
 <tr><td>US W</td><td>4-6,5</td><td>6,5-8,5</td><td>9-11</td></tr>
 <tr><td>Mondo</td><td>21-23,5</td><td>23,5-25,5</td><td>26-28</td></tr>
</tbody></table>'}

{assign var='unionmen' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th></tr></thead><tbody>
 <tr><td>EU</td><td>37-41</td><td>40-43</td><td>43+</td></tr>
 <tr><td>US Men</td><td>5,5-7,5</td><td>8-10</td><td>10,5-13</td></tr>
 <tr><td>Mondo</td><td>23,5-25,5</td><td>26-28</td><td>28,5-31</td></tr>
</tbody></table>'}

{assign var='bentmetalmen' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th></tr></thead><tbody>
 <tr><td>EU</td><td>36,5-40,5</td><td>40,5-44,5</td><td>44,5-48,5</td></tr>
 <tr><td>US Men</td><td>5-8</td><td>7-11</td><td>11-14</td></tr>
 <tr><td>Mondo</td><td>22-25,5</td><td>25,5-27</td><td>27-30,5</td></tr>
</tbody></table>'}

{assign var='bentmetalwomen' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>M</th><th>L</th></tr></thead><tbody>
 <tr><td>EU</td><td>36-38</td><td>39+</td></tr>
 <tr><td>US Women</td><td>5-8</td><td>9+</td></tr>
 <tr><td>Mondo</td><td>22-24</td><td>25+</td></tr>
</tbody></table>'}

{assign var='burtonmen' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th><th>XL</th></tr></thead><tbody>
 <tr><td>EU</td><td>38-41</td><td>41,5-43,5</td><td>44-46</td><td>47-48</td></tr>
 <tr><td>US Men</td><td>6-8</td><td>8,5-10,5</td><td>11-13</td><td>14-15</td></tr>
 <tr><td>Mondo</td><td>24-26</td><td>26,5-28,5</td><td>29-31</td><td>32-33</td></tr>
</tbody></table>'}

{assign var='burtonwomen' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th></tr></thead><tbody>
 <tr><td>EU</td><td>34-36,5</td><td>36,5-40</td><td>40+</td></tr>
 <tr><td>US Women</td><td>4-6</td><td>6-8</td><td>8+</td></tr>
 <tr><td>Mondo</td><td>21-23</td><td>23-25</td><td>25+</td></tr>
</tbody></table>'}

{assign var='bataleonbinding' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M/L</th><th>L/XL</th></tr></thead><tbody>
 <tr><td>EU</td><td>36-40</td><td>39-44</td><td>43-47</td></tr>
 <tr><td>US Men</td><td>4,5-7,5</td><td>7-10,5</td><td>10-13</td></tr>
 <tr><td>US Women</td><td>6,0-9,0</td><td>8,5-12</td><td>11,5-14,5</td></tr>
 <tr><td>Mondo</td><td>22,5-25,5</td><td>25-28,5</td><td>28-31</td></tr>
</tbody></table>'}

{assign var='fluxbinding' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>XS</th><th>S</th><th>M</th><th>L</th></tr></thead><tbody>
 <tr><td>EU</td><td>34-37</td><td>36-40,5</td><td>40-42,5</td><td>42+</td></tr>
 <tr><td>US Men</td><td>3-5,5</td><td>4,5-7,5</td><td>7-9,5</td><td>9+</td></tr>
 <tr><td>US Women</td><td>4-6,5</td><td>7-9,5</td><td>8-10,5</td><td>&nbsp;</td></tr>
 <tr><td>Mondo</td><td>21-23,5</td><td>22,5-25,5</td><td>25,5-27,5</td><td>27+</td></tr>
</tbody></table>'}

{assign var='gnumen' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th><th>XL</th></tr></thead><tbody>
 <tr><td>EU</td><td>36,0-38,5</td><td>38,5-41,5</td><td>41,5-44,5</td><td>45,0-46,0</td></tr>
 <tr><td>US Men</td><td>5-7</td><td>6-9</td><td>9-11</td><td>12-14</td></tr>
 <tr><td>Mondo</td><td>21,0-24,5</td><td>25,0-27,0</td><td>27,0-29,0</td><td>29,0-31,0</td></tr>
</tbody></table>'}

{assign var='gnuwomen' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th></tr></thead><tbody>
 <tr><td>EU</td><td>35,0-37,5</td><td>37,5-40,0</td><td>40,0-42,0</td></tr>
 <tr><td>US Women</td><td>5,0-7,0</td><td>7,0-9,0</td><td>9,0-11,0</td></tr>
</tbody></table>'}

{assign var='k2men' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th><th>XL</th></tr></thead><tbody>
 <tr><td>Euro</td><td>33-36</td><td>36-40,5</td><td>40,5-44,5</td><td>44,5-50</td></tr>
 <tr><td>US Men</td><td>2-5</td><td>5-9</td><td>8-12</td><td>11-15</td></tr>
</tbody></table>'}

{assign var='k2women' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th></tr></thead><tbody>
 <tr><td>Euro</td><td>33-36</td><td>36-41,5</td><td>&nbsp;</td></tr>
 <tr><td>US Women</td><td>3-6</td><td>6-10</td><td>9+</td></tr>
</tbody></table>'}

{assign var='nideckerbinding' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>M</th><th>L</th><th>XL</th></tr></thead><tbody>
 <tr><td>Euro</td><td>36-41,5</td><td>41-45</td><td>44-48,5</td></tr>
 <tr><td>US Men</td><td>4,5-8,5</td><td>8-11,5</td><td>10,5-14</td></tr>
 <tr><td>US Women</td><td>6-10</td><td>9+</td><td>&nbsp;</td></tr>
 <tr><td>Mondo</td><td>22,5-26,5</td><td>26,0-29,5</td><td>28,5-31,5</td></tr>
</tbody></table>'}

{assign var='ridemen' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th></tr></thead><tbody>
 <tr><td>Euro</td><td>35-40,5</td><td>37-43,5</td><td>43,5-50+</td></tr>
 <tr><td>US Men</td><td>4-8</td><td>6-10</td><td>10,5+</td></tr>
 <tr><td>Mondo</td><td>22-26</td><td>24-28</td><td>28-33+</td></tr>
</tbody></table>'}

{assign var='ridewomen' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th></tr></thead><tbody>
 <tr><td>Euro</td><td>35-40,5</td><td>37-43,5</td></tr>
 <tr><td>US Women</td><td>5-9</td><td>7-11</td></tr>
 <tr><td>Mondo</td><td>22-26</td><td>24-28</td></tr>
</tbody></table>'}

{assign var='romebinding' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M/L</th><th>L/XL</th></tr></thead><tbody>
 <tr><td>Euro</td><td>36,5-40</td><td>40-44</td><td>44-48</td></tr>
 <tr><td>US Men</td><td>5-7</td><td>7,5-10</td><td>10,5-12,5</td></tr>
 <tr><td>US Women</td><td>6,5-9,5</td><td>9-12,5</td><td>&nbsp;</td></tr>
 <tr><td>Mondo</td><td>23-25</td><td>25,5-28</td><td>28,5-30,5</td></tr>
</tbody></table>'}

{assign var='salomonbinding' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th></tr></thead><tbody>
 <tr><td>Euro</td><td>34,5-40</td><td>39-43,5</td><td>43-47</td></tr>
 <tr><td>US Men</td><td>3,5-7,5</td><td>7-10,5</td><td>10-13,5</td></tr>
 <tr><td>US Women</td><td>4-8,5</td><td>8-11,5</td><td>11+</td></tr>
 <tr><td>Mondo</td><td>22-25,5</td><td>25-28,5</td><td>28-31,5</td></tr>
</tbody></table>'}

{assign var='roxybinding' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S/M</th><th>M/L</th></tr></thead><tbody>
 <tr><td>Euro</td><td>33,5-37,5</td><td>37-42</td></tr>
 <tr><td>US Women</td><td>4-7</td><td>6,5-11</td></tr>
 <tr><td>Mondo</td><td>22-24</td><td>24-28</td></tr>
</tbody></table>'}

{assign var='spbinding' value='<table class="size-table-style-binding">
<thead><tr class="size-table-first-row-binding"><th></th><th>S</th><th>M</th><th>L</th><th>XL</th></tr></thead><tbody>
 <tr><td>US Men</td><td>5-8</td><td>7-10</td><td>9-12</td><td>11-14</td></tr>
 <tr><td>Mondo</td><td>23-26</td><td>25-28</td><td>27-30</td><td>29-32</td></tr>
</tbody></table>'}

{assign var='mobile' value=false}

{if $oPlugin_size_tables->getConfig()->getValue('size_tables_mobile_active') !== 'on' && $isMobile}
      {assign var='mobile' value=true}
{/if}



{foreach from=$oPlugin_size_tables->getConfig()->getValue('size_tables_values') item=sizeValue}
  {if $sizeValue == $Artikel->kWarengruppe}
      {assign var="isMatchFound" value=true}
      {break}
  {/if}
{/foreach}

{foreach from=$oPlugin_size_tables->getConfig()->getValue('size_tables_values_bindings') item=sizeValue}
  {if $sizeValue == $Artikel->kWarengruppe}
      {assign var="isMatchFoundBindings" value=true}
      {break}
  {/if}
{/foreach}


 {if $oPlugin_size_tables->getConfig()->getValue('size_tables_active') === 'on' && $isMatchFound === true && $mobile === false}

    <button type="button" id="sizeBtnShoes" class="gclassolli" {if $oPlugin_size_tables->getConfig()->getValue('size_tables_name_active') === 'on'}style="display: inline-flex; justify-content: center; align-items: center;"{/if}><i class="fas fa-ruler-horizontal fa-lg"></i>
    {if $oPlugin_size_tables->getConfig()->getValue('size_tables_name_active') === 'on'}
      <span style='font-family: "Open Sans", sans-serif; font-size: 0.875rem; padding-bottom: auto; padding-top: auto; margin-left: 5px;'>
        {$oPlugin_size_tables->getLocalization()->getTranslation('size_heading')}
      </span>
    {/if}
    </button>
    <div id='sizeModalShoes' class='modalpopup'>
        <div class='modal-content'>
            <div class="close-the-modal">
                <span class="close-btn">&times;</span>
            </div>
            <div class="popup-content">
                <h2 class="modal-header">{$oPlugin_size_tables->getLocalization()->getTranslation('size_heading')} {$Artikel->cHersteller}</h2>
                <div class="testcontainer">
                {if $Artikel->cHersteller === 'Burton'}
                  {$burton}
                {/if}
                {if $Artikel->cHersteller === 'Nidecker/Flow'}
                  {$nidecker}
                {/if}
                {if $Artikel->cHersteller === 'Flow'}
                  {$flow}
                {/if}
                {if $Artikel->cHersteller === 'ThirtyTwo'}
                  {$thirtytwo}
                {/if}
                {if $Artikel->cHersteller === 'DC'}
                  {$dc}
                {/if}
                {if $Artikel->cHersteller === 'Ride'}
                  {$ride}
                {/if}
                {if $Artikel->cHersteller === 'Deeluxe'}
                  {$deeluxe}
                {/if}
                {if $Artikel->cHersteller === 'Rome'}
                  {$rome}
                {/if}
                {if $Artikel->cHersteller === 'K2'}
                  {$k2}
                {/if}
                {if $Artikel->cHersteller === 'Nitro'}
                  {$nitro}
                {/if}
                {if $Artikel->cHersteller === 'Salomon'}
                  {$salomon}
                {/if}
                </div>
            </div>
        </div>
    </div>


    <script>
    var sizeModalShoes = document.getElementById('sizeModalShoes');
    var sizeBtnShoes = document.getElementById('sizeBtnShoes');
    var sizeCloseShoes = sizeModalShoes.querySelector('.close-btn');
    sizeBtnShoes.addEventListener('click', function() { sizeModalShoes.style.display = 'block'; });
    sizeCloseShoes.addEventListener('click', function() { sizeModalShoes.style.display = 'none'; });
    window.addEventListener('click', function(event) {
        if (event.target === sizeModalShoes) { sizeModalShoes.style.display = 'none'; }
    });
    </script>

{/if}


{if $oPlugin_size_tables->getConfig()->getValue('size_tables_active') === 'on' && $isMatchFoundBindings === true && $mobile === false}

  <button type="button" id="sizeBtnBindings" class="gclassolli" {if $oPlugin_size_tables->getConfig()->getValue('size_tables_name_active') === 'on'}style="display: inline-flex; justify-content: center; align-items: center;"{/if}><i class="fas fa-ruler-horizontal fa-lg"></i>
  {if $oPlugin_size_tables->getConfig()->getValue('size_tables_name_active') === 'on'}
    <span style='font-family: "Open Sans", sans-serif; font-size: 0.875rem; padding-bottom: auto; padding-top: auto; margin-left: 5px;'>
      {$oPlugin_size_tables->getLocalization()->getTranslation('size_heading')}
    </span>
  {/if}
  </button>
  <div id='sizeModalBindings' class='modalpopup'>
      <div class='modal-content'>
          <div class="close-the-modal">
              <span class="close-btn">&times;</span>
          </div>
          <div class="popup-content">
              <h2 class="modal-header">{$oPlugin_size_tables->getLocalization()->getTranslation('size_heading')} {$Artikel->cHersteller}</h2>
              <div class="testcontainer">

              {if $Artikel->kWarengruppe == $oPlugin_size_tables->getConfig()->getValue('size_tables_values_bindings_men')}
                {if $Artikel->cHersteller === 'Burton'}
                  {$burtonmen}
                {/if}
                {if $Artikel->cHersteller === 'Bent Metal'}
                  {$bentmetalmen}
                {/if}
                {if $Artikel->cHersteller === 'Bataleon'}
                  {$bataleonbinding}
                {/if}
                {if $Artikel->cHersteller === 'Flux'}
                  {$fluxbinding}
                {/if}
                {if $Artikel->cHersteller === 'Gnu'}
                  {$gnumen}
                {/if}
                {if $Artikel->cHersteller === 'K2'}
                  {$k2men}
                {/if}
                {if $Artikel->cHersteller === 'Nidecker/Flow'}
                  {$nideckerbinding}
                {/if}
                {if $Artikel->cHersteller === 'Ride'}
                  {$ridemen}
                {/if}
                {if $Artikel->cHersteller === 'Rome'}
                  {$romebinding}
                {/if}
                {if $Artikel->cHersteller === 'Salomon'}
                  {$salomonbinding}
                {/if}
                {if $Artikel->cHersteller === 'SP'}
                  {$spbinding}
                {/if}
                {if $Artikel->cHersteller === 'Union'}
                  {$unionmen}
                {/if}
              {/if}
              {if $Artikel->kWarengruppe == $oPlugin_size_tables->getConfig()->getValue('size_tables_values_bindings_women')}
                {if $Artikel->cHersteller === 'Burton'}
                  {$burtonwomen}
                {/if}
                {if $Artikel->cHersteller === 'Bent Metal'}
                  {$bentmetalwomen}
                {/if}
                {if $Artikel->cHersteller === 'Bataleon'}
                  {$bataleonbinding}
                {/if}
                {if $Artikel->cHersteller === 'Flux'}
                  {$fluxbinding}
                {/if}
                {if $Artikel->cHersteller === 'Gnu'}
                  {$gnuwomen}
                {/if}
                {if $Artikel->cHersteller === 'K2'}
                  {$k2women}
                {/if}
                {if $Artikel->cHersteller === 'Nidecker/Flow'}
                  {$nideckerbinding}
                {/if}
                {if $Artikel->cHersteller === 'Ride'}
                  {$ridewomen}
                {/if}
                {if $Artikel->cHersteller === 'Rome'}
                  {$romebinding}
                {/if}
                {if $Artikel->cHersteller === 'Roxy'}
                  {$roxybinding}
                {/if}
                {if $Artikel->cHersteller === 'Salomon'}
                  {$salomonbinding}
                {/if}
                {if $Artikel->cHersteller === 'SP'}
                  {$spbinding}
                {/if}
                {if $Artikel->cHersteller === 'Union'}
                  {$unionwomen}
                {/if}
              {/if}
              </div>
              <br>
              <h3 style="color: red;">{$oPlugin_size_tables->getLocalization()->getTranslation('warning_bindings')}</h3>
          </div>
      </div>
  </div>


  <script>
    var sizeModalBindings = document.getElementById('sizeModalBindings');
    var sizeBtnBindings = document.getElementById('sizeBtnBindings');
    var sizeCloseBindings = sizeModalBindings.querySelector('.close-btn');
    sizeBtnBindings.addEventListener('click', function() { sizeModalBindings.style.display = 'block'; });
    sizeCloseBindings.addEventListener('click', function() { sizeModalBindings.style.display = 'none'; });
    window.addEventListener('click', function(event) {
        if (event.target === sizeModalBindings) { sizeModalBindings.style.display = 'none'; }
    });
  </script>

{/if}



{/block}