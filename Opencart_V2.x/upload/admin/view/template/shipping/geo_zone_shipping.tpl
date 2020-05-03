<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="page-header">
	<div class="container-fluid">
		<div class="pull-right">
			<button type="submit" form="form-geo_shipping" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
		</div>
		<h1><?php echo $heading_title; ?></h1>
		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
	</div>
</div>
<div class="container-fluid">
<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
	<button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<?php } ?>
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
	</div>
	<div class="panel-body">
		<form action="<?php echo $action ;?>" method="post" enctype="multipart/form-data" id="form-geo_shipping" class="form-horizontal">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
				<li><a href="#tab-methods" data-toggle="tab"><?php echo $tab_methods; ?></a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab-general">
					<div class="form-group">
						<label class="control-label col-sm-3" for="geo_zone_shipping_status"><?php echo $entry_status; ?></label>
						<div class="col-sm-9">
							<select name="geo_zone_shipping_status" class="form-control">
								<?php if($geo_zone_shipping_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="geo_zone_shipping_sort_order"><?php echo $entry_sort_order; ?></label>
						<div class="col-sm-9">
							<input type="text" name="geo_zone_shipping_sort_order" value="<?php echo $geo_zone_shipping_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="geo_zone_shipping_sort_order" class="form-control" />
						</div>
					</div>
					<div class="row-fluid">
						<div class="pull-right btn btn-primary" onclick="switchToTab('tab-methods');"><?php echo $text_next; ?> <i class="fa fa-arrow-right"></i></div>
					</div>
				</div>
				<div class="tab-pane" id="tab-methods">
					<table id="shipping_methods" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<td width="30%"><?php echo $column_general; ?></td>
								<td width="30%"><?php echo $column_availability; ?></td>
								<td><?php echo $column_cost; ?></td>
								<td>&nbsp;</td>
							</tr>
						</thead>
						<tbody>
							<?php $row = 0; ?>
							<?php foreach($geo_zone_shipping_methods as $method) { ?>
							<tr id="shipping-row<?php echo $row; ?>">
								<td class="text-left">
									<div class="form-group col-sm-12 required">
										<label class="control-label"><?php echo $entry_method_name; ?></label>
										<?php foreach($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon">
											<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
											</span>
											<input type="text" name="geo_zone_shipping_methods[<?php echo $row;?>][name][<?php echo $language['language_id']; ?>]" value="<?php echo $method['name'][$language['language_id']]; ?>" placeholder="<?php echo $entry_method_name; ?>" class="form-control" />
										</div>
										<?php if(isset($error_method[$row]['name'][$language['language_id']])) { ?>
										<div class="text-danger"><?php echo $error_method[$row]['name'][$language['language_id']]; ?></div>
										<?php } ?>
										<?php } ?>
									</div>
									<div class="form-group col-sm-12">
										<label class="control-label"><?php echo $entry_instruction; ?></label>
										<?php foreach($languages as $language) { ?>
										<div class="input-group">
											<span class="input-group-addon">
											<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
											</span>
											<textarea name="geo_zone_shipping_methods[<?php echo $row; ?>][instruction][<?php echo $language['language_id']; ?>]" rows="5" placeholder="<?php echo $entry_instruction; ?>" class="form-control"><?php echo $method['instruction'][$language['language_id']]; ?></textarea>
										</div>
										<?php } ?>
									</div>
								</td>
								<td class="text-left">
									<div class="form-group col-sm-12 required">
										<label class="control-label"><?php echo $entry_status; ?></label>
										<select name="geo_zone_shipping_methods[<?php echo $row; ?>][status]" class="form-control">
											<?php if($method['status']) { ?>
											<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
											<option value="0"><?php echo $text_disabled; ?></option>
											<?php } else { ?>
											<option value="1"><?php echo $text_enabled; ?></option>
											<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
											<?php } ?>
										</select>
										<?php if(isset($error_method[$row]['status'])) { ?>
										<div class="text-danger"><?php echo $error_method[$row]['status']; ?></div>
										<?php } ?>
									</div>
									<div class="form-group col-sm-12">
										<label class="control-label">
										<span data-toggle="tooltip" title="<?php echo $entry_total_help; ?>"><?php echo $entry_total; ?></span>
										</label>
										<input type="number" step=".01" name="geo_zone_shipping_methods[<?php echo $row; ?>][total]" value="<?php echo $method['total']; ?>" placeholder="<?php echo $entry_total; ?>" class="form-control"  min="0"/>
										<?php if(isset($error_method[$row]['total'])) { ?>
										<div class="text-danger"><?php echo $error_method[$row]['total']; ?></div>
										<?php } ?>
									</div>
									<div class="form-group col-sm-12 required">
										<label class="control-label"><?php echo $entry_geo_zone; ?></label>
										<select name="geo_zone_shipping_methods[<?php echo $row; ?>][geo_zone_id]" class="form-control">
											<option value="0"><?php echo $text_all_zones; ?></option>
											<?php foreach($geo_zones as $geo_zone) { ?>
											<?php if($geo_zone['geo_zone_id'] == $method['geo_zone_id']) { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
											<?php } ?>
											<?php } ?>
										</select>
										<?php if(isset($error_method[$row]['geo_zone_id'])) { ?>
										<div class="text-danger"><?php echo $error_method[$row]['geo_zone_id']; ?></div>
										<?php } ?>
									</div>
								</td>
								<td class="text-left">
									<div class="form-group col-sm-12 required">
										<label class="control-label"><?php echo $entry_cost_type; ?></label>
										<select name="geo_zone_shipping_methods[<?php echo $row; ?>][cost_type]" class="form-control cost_type">
											<option value="flat" <?php if($method['cost_type'] == 'flat') { ?>selected<?php } ?>><?php echo $entry_flat_cost; ?></option>
											<option value="price" <?php if($method['cost_type'] == 'price') { ?>selected<?php } ?>><?php echo $entry_price_cost; ?></option>
											<option value="weight" <?php if($method['cost_type'] == 'weight') { ?>selected<?php } ?>><?php echo $entry_weight_cost; ?></option>
										</select>
										<?php if(isset($error_method[$row]['cost_type'])) { ?>
										<div class="text-danger"><?php echo $error_method[row]['cost_type']; ?></div>
										<?php } ?>
									</div>


									<?php // Flat Cost Shipping ?>
									<div class="form-group col-sm-12 required _flat" <?php if($method['cost_type'] != 'flat') { ?>style="display: none;"<?php } ?>>
										<label class="control-label">
										<span data-toggle="tooltip" title="<?php echo $entry_flat_cost_help; ?>"><?php echo $entry_flat_cost; ?></span>
										</label>
										<input type="number" step=".01" name="geo_zone_shipping_methods[<?php echo $row; ?>][flat_cost]" value="<?php echo $method['flat_cost']; ?>" placeholder="<?php echo $entry_flat_cost; ?>" class="form-control" min="0" />
										<?php if(isset($error_method[$row]['cost_type'])) { ?>
										<div class="text-danger"><?php echo $error_method[row]['flat_cost']; ?></div>
										<?php } ?>
									</div>
									<?php // Flat Cost Shipping ?>


									<?php // Total Based Shipping ?>
									<div class="form-group col-sm-12 required _price" <?php if($method['cost_type'] != 'price') {?>style="display: none;"<?php } ?>>
										<label class="control-label">
										<span data-toggle="tooltip" title="<?php echo $entry_price_help; ?>"><?php echo $entry_price; ?></span>
										</label>
										<input type="number" step=".01" name="geo_zone_shipping_methods[<?php echo $row; ?>][price]" value="<?php echo $method['price']; ?>" placeholder="<?php echo $entry_price; ?>" class="form-control" min="0" />
										<?php if(isset($error_method[$row]['price'])) { ?>
										<div class="text-danger"><?php echo $error_method[row]['price']; ?></div>
										<?php } ?>
									</div>
									<div class="form-group col-sm-12 required _price" <?php if($method['cost_type'] != 'price') {?>style="display: none;"<?php } ?>>
										<label class="control-label">
										<span data-toggle="tooltip" title="<?php echo $entry_price_cost_help2; ?>"><?php echo $entry_price_cost; ?></span>
										</label>
										<input type="text" name="geo_zone_shipping_methods[<?php echo $row; ?>][price_cost]" value="<?php echo $method['price_cost']; ?>" placeholder="<?php echo $entry_price_cost_help1; ?>" class="form-control" min="0" />
										<?php if(isset($error_method[$row]['price_cost'])) { ?>
										<div class="text-danger"><?php echo $error_method[row]['price_cost']; ?></div>
										<?php } ?>
									</div>
									<?php // Total Based Shipping ?>


									<?php // Weight Based Shipping ?>
									<div class="form-group col-sm-12 required _weight" <?php if($method['cost_type'] != 'weight') {?>style="display: none;"<?php } ?>>
										<label class="control-label">
										<span data-toggle="tooltip" title="<?php echo $entry_weight_help; ?>"><?php echo $entry_weight; ?></span>
										</label>
										<input type="number" step=".01" name="geo_zone_shipping_methods[<?php echo $row; ?>][weight]" value="<?php echo $method['weight']; ?>" placeholder="<?php echo $entry_weight; ?>" class="form-control" min="0" />
										<?php if(isset($error_method[$row]['weight'])) { ?>
										<div class="text-danger"><?php echo $error_method[row]['weight']; ?></div>
										<?php } ?>
									</div>
									<div class="form-group col-sm-12 required _weight" <?php if($method['cost_type'] != 'weight') {?>style="display: none;"<?php } ?>>
										<label class="control-label">
										<span data-toggle="tooltip" title="<?php echo $entry_weight_cost_help2; ?>"><?php echo $entry_weight_cost; ?></span>
										</label>
										<input type="text" name="geo_zone_shipping_methods[<?php echo $row; ?>][weight_cost]" value="<?php echo $method['weight_cost']; ?>" placeholder="<?php echo $entry_weight_cost_help1; ?>" class="form-control" min="0" />
										<?php if(isset($error_method[$row]['weight_cost'])) { ?>
										<div class="text-danger"><?php echo $error_method[row]['weight_cost']; ?></div>
										<?php } ?>
									</div>
									<?php // Weight Based Shipping ?>


									<div class="form-group col-sm-12 required">
										<label class="control-label"><?php echo $entry_tax_class; ?></label>
										<select name="geo_zone_shipping_methods[<?php echo $row; ?>][tax_class_id]" class="form-control">
											<option value=""><?php echo $entry_no_tax_class; ?></option>
											<?php foreach($tax_classes as $tax_class) { ?>
											<?php if($tax_class['tax_class_id'] == $method['tax_class_id']) { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
											<?php } else { ?>
											<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
											<?php } ?>
											<?php } ?>
										</select>
										<?php if(isset($error_method['tax_class_id'])) { ?>
										<div class="text-danger"><?php echo $error_method[$row]['tax_class_id']; ?></div>
										<?php } ?>
									</div>
								</td>
								<td class="text-left"><button type="button" onclick="$('#shipping-row<?php echo $row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
							</tr>
							<?php $row = $row + 1; ?>
							<?php } ?>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="3"></td>
								<td class="text-left"><button type="button" onclick="addRow();" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</form>
	</div>
</div>
<style type="text/css">
	table#shipping_methods tr:not(:last-child) {
	border-bottom: 2px rgb(192,192,192) solid;
	}
</style>
<script type="text/javascript"><!--
	$(document).ready(function(){
		var active_tab = $(".tab-pane .text-danger").eq(0).parents(".tab-pane").attr("id");
		$("a[href='#"+active_tab+"'").trigger("click");
	});
	
	$(document).on('change', 'select.cost_type', function(){
		$('._flat', $(this).parents('tr')).hide();
		$('._price', $(this).parents('tr')).hide();
		$('._weight', $(this).parents('tr')).hide();
		if($(this).val() == 'price'){
			$('._price', $(this).parents('tr')).show();
		} else if($(this).val() == 'weight'){
			$('._weight', $(this).parents('tr')).show();
		} else {
			$('._flat', $(this).parents('tr')).show();
		}
	});
	
	function switchToTab(tab_name){
	  $('.nav-tabs a[href="#'+tab_name+'"]').tab('show');
	}
	
	var row = <?php echo $row; ?>;
	
	function addRow() {
		html =	'<tr id="shipping-row'+row+'">'
			+			'<td class="text-left">'
			+				'<div class="form-group col-sm-12 required">'
			+					'<label class="control-label"><?php echo $entry_method_name; ?></label>';
								<?php foreach($languages as $language) { ?>
		html +=				'<div class="input-group">'
			+						'<span class="input-group-addon">'
			+							'<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />'
			+						'</span>'
			+						'<input type="text" name="geo_zone_shipping_methods['+row+'][name][<?php echo $language['language_id']; ?>]" value="" placeholder="<?php echo $entry_method_name; ?>" class="form-control" />'
			+					'</div>';
								<?php } ?>
		html +=			'</div>'
			+				'<div class="form-group col-sm-12">'
			+					'<label class="control-label"><?php echo $entry_instruction; ?></label>';
								<?php foreach($languages as $language) { ?>
		html +=				'<div class="input-group">'
			+						'<span class="input-group-addon">'
			+							'<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />'
			+						'</span>'
			+						'<textarea name="geo_zone_shipping_methods['+row+'][instruction][<?php echo $language['language_id']; ?>]" rows="5" placeholder="<?php echo $entry_instruction; ?>" class="form-control"></textarea>'
			+					'</div>';
								<?php } ?>
		html +=			'</div>'
			+			'</td>'
			+			'<td class="text-left">'
			+				'<div class="form-group col-sm-12 required">'
			+					'<label class="control-label"><?php echo $entry_status; ?></label>'
			+					'<select name="geo_zone_shipping_methods['+row+'][status]" class="form-control">'
			+						'<option value="1" selected="selected"><?php echo $text_enabled; ?></option>'
			+						'<option value="0"><?php echo $text_disabled; ?></option>'
			+					'</select>'
			+				'</div>'
			+				'<div class="form-group col-sm-12">'
			+					'<label class="control-label">'
			+						'<span data-toggle="tooltip" title="<?php echo $entry_total_help; ?>"><?php echo $entry_total; ?></span>'
			+					'</label>'
			+					'<input type="number" step=".01" name="geo_zone_shipping_methods['+row+'][total]" value="" placeholder="<?php echo $entry_total; ?>" class="form-control"  min="0"/>'
			+				'</div>'
			+				'<div class="form-group col-sm-12 required">'
			+					'<label class="control-label"><?php echo $entry_geo_zone; ?></label>'
			+					'<select name="geo_zone_shipping_methods['+row+'][geo_zone_id]" class="form-control">'
			+						'<option value="0" selected="selected"><?php echo $text_all_zones; ?></option>';
									<?php foreach($geo_zones as $geo_zone) { ?>
		html +=					'<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo addslashes($geo_zone['name']); ?></option>';
									<?php } ?>
		html +=				'</select>'
			+				'</div>'
			+			'</td>'
			+			'<td class="text-left">'
			+				'<div class="form-group col-sm-12 required">'
			+					'<label class="control-label"><?php echo $entry_cost_type; ?></label>'
			+					'<select name="geo_zone_shipping_methods['+row+'][cost_type]" class="form-control cost_type">'
			+						'<option value="flat" selected="selected"><?php echo $entry_flat_cost; ?></option>'
			+						'<option value="price"><?php echo $entry_price_cost; ?></option>'
			+						'<option value="weight"><?php echo $entry_weight_cost; ?></option>'
			+					'</select>'
			+				'</div>'
	
	
			+				'<div class="form-group col-sm-12 required _flat">'
			+					'<label class="control-label">'
			+						'<span data-toggle="tooltip" title="<?php echo $entry_flat_cost_help; ?>"><?php echo $entry_flat_cost; ?></span>'
			+					'</label>'
			+					'<input type="number" step=".01" name="geo_zone_shipping_methods['+row+'][flat_cost]" value="" placeholder="<?php echo $entry_flat_cost; ?>" class="form-control" min="0" />'
			+				'</div>'
	
	
			+				'<div class="form-group col-sm-12 required _price" style="display: none;">'
			+					'<label class="control-label">'
			+						'<span data-toggle="tooltip" title="<?php echo $entry_price_help; ?>"><?php echo $entry_price; ?></span>'
			+					'</label>'
			+					'<input type="text" name="geo_zone_shipping_methods['+row+'][price]" value="" placeholder="<?php echo $entry_price; ?>" class="form-control" min="0" />'
			+				'</div>'
			+				'<div class="form-group col-sm-12 required _price" style="display: none;">'
			+					'<label class="control-label">'
			+						'<span data-toggle="tooltip" title="<?php echo $entry_price_cost_help2; ?>"><?php echo $entry_price_cost; ?></span>'
			+					'</label>'
			+					'<input type="text" name="geo_zone_shipping_methods['+row+'][price_cost]" value="" placeholder="<?php echo $entry_price_cost_help1; ?>" class="form-control" min="0" />'
			+				'</div>'
	
	
			+				'<div class="form-group col-sm-12 required _weight" style="display: none;">'
			+					'<label class="control-label">'
			+						'<span data-toggle="tooltip" title="<?php echo $entry_weight_help; ?>"><?php echo $entry_weight; ?></span>'
			+					'</label>'
			+					'<input type="text" name="geo_zone_shipping_methods['+row+'][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="form-control" min="0" />'
			+				'</div>'
			+				'<div class="form-group col-sm-12 required _weight" style="display: none;">'
			+					'<label class="control-label">'
			+						'<span data-toggle="tooltip" title="<?php echo $entry_weight_cost_help2; ?>"><?php echo $entry_weight_cost; ?></span>'
			+					'</label>'
			+					'<input type="text" name="geo_zone_shipping_methods['+row+'][weight_cost]" value="" placeholder="<?php echo $entry_weight_cost_help1; ?>" class="form-control" min="0" />'
			+				'</div>'
			+				'<div class="form-group col-sm-12 required">'
			+					'<label class="control-label"><?php echo $entry_tax_class; ?></label>'
			+					'<select name="geo_zone_shipping_methods['+row+'][tax_class_id]" class="form-control">'
			+						'<option value=""><?php echo $entry_no_tax_class; ?></option>';
									<?php foreach($tax_classes as $tax_class) { ?>
		html +=					'<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>';
									<?php } ?>
		html +=				'</select>'
				+			'</div>'
				+		'</td>'
				+		'<td class="text-left"><button type="button" onclick="$(\'#shipping-row'+row+'\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>'
				+	'</tr>';
	
	
		$('#shipping_methods tbody').append(html);
		row++;
	}
	//-->
</script>
<?php echo $footer; ?>