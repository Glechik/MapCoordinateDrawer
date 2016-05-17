//
//  ViewController.swift
//  MapCoordinateDrawer
//
//  Created by Dmitry Savchenko on 13.05.16.
//  Copyright © 2016 Dmitry Savchenko. All rights reserved.
//

import UIKit
import MapKit

class MercatorViewController: UIViewController
{
    @IBOutlet weak var mapImageView: UIImageView!
    @IBOutlet weak var latLabel: UITextField!
    @IBOutlet weak var lngLabel: UITextField!

    @IBAction func addPointClick(sender: AnyObject)
    {
        let coordinates2d = CLLocationCoordinate2DMake(CLLocationDegrees(latLabel.text!)!, CLLocationDegrees(lngLabel.text!)!)

        mapImageView.addLocation(coordinates2d)

        // max MKMapPoint values
        let maxY = Double(267995781)
        let maxX = Double(268435456)


        let mapPoint = MKMapPointForCoordinate(coordinates2d)

        let normalizatePointX = CGFloat(mapPoint.x / maxX)
        let normalizatePointY = CGFloat(mapPoint.y / maxY)

        let pointView = UIView(frame: CGRectMake(0, 0, 5, 5))
        pointView.center = CGPointMake(normalizatePointX * mapImageView.frame.width, normalizatePointY * mapImageView.frame.height)
        pointView.backgroundColor = UIColor.blueColor()

        mapImageView.addSubview(pointView)
    }

    @IBAction func clearButtonClick(sender: AnyObject)
    {
        mapImageView.subviews.forEach({ $0.removeFromSuperview() })
    }
}

extension UIView
{
    func addLocation(coordinate: CLLocationCoordinate2D)
    {
        // max MKMapPoint values
        let maxY = Double(267995781)
        let maxX = Double(268435456)

        let mapPoint = MKMapPointForCoordinate(coordinate)

        let normalizatePointX = CGFloat(mapPoint.x / maxX)
        let normalizatePointY = CGFloat(mapPoint.y / maxY)

        let pointView = UIView(frame: CGRectMake(0, 0, 5, 5))
        pointView.center = CGPointMake(normalizatePointX * frame.width, normalizatePointY * frame.height)

        pointView.backgroundColor = UIColor.blueColor()

        addSubview(pointView)
    }
}

